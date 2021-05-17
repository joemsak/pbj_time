require 'rails_helper'

RSpec.describe Announcement, type: :model do
  describe "a valid announcement" do
    let(:announcement) { build(:announcement) }

    it "requires title" do
      announcement.title = nil
      expect(announcement).not_to be_valid
      expect(announcement.errors[:title]).to eq(["can't be blank"])
    end

    it "requires content" do
      announcement.content = nil
      expect(announcement).not_to be_valid
      expect(announcement.errors[:content]).to eq(["can't be blank"])
    end

    it "requires published_at" do
      announcement.published_at = nil
      expect(announcement).not_to be_valid
      expect(announcement.errors[:published_at]).to eq(["can't be blank"])
    end
  end

  describe ".upcoming" do
    it "only includes the future `published_at` announcements" do
      yesterday = create(:announcement, published_at: 1.day.ago)
      tomorrow = create(:announcement, published_at: 1.day.from_now)
      expect(Announcement.upcoming).to eq([tomorrow])
    end

    it "sorts ascending" do
      in_two_days = create(:announcement, published_at: 2.days.from_now)
      tomorrow = create(:announcement, published_at: 1.day.from_now)
      expect(Announcement.upcoming).to eq([tomorrow, in_two_days])
    end
  end

  describe ".published" do
    it "only includes the current/past `published_at` announcements" do
      yesterday = create(:announcement, published_at: 1.day.ago)
      tomorrow = create(:announcement, published_at: 1.day.from_now)
      expect(Announcement.published).to eq([yesterday])
    end

    it "sorts ascending" do
      two_days_ago = create(:announcement, published_at: 2.days.ago)
      yesterday = create(:announcement, published_at: 1.day.ago)
      expect(Announcement.published).to eq([yesterday, two_days_ago])
    end
  end
end
