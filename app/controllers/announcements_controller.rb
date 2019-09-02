# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  before_action :mark_as_read, if: :user_signed_in?
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @announcements = Announcement.order(published_at: :desc)
  end

  private

  def mark_as_read
    current_user.update(announcements_last_read_at: Time.zone.now)
  end
end
