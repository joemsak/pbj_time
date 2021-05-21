class Public::AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.published
  end
end
