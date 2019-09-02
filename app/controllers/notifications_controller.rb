# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end
end
