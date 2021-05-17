class Announcement < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :upcoming, -> {
    where("published_at > ?", Time.current).order(:published_at)
  }

  scope :published, -> {
    where("published_at <= ?", Time.current)
      .order(published_at: :desc)
  }

  validates :title, :content, :published_at, presence: true
end
