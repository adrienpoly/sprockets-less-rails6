# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SprocketsLessRails
  class Application < Rails::Application
    # Expose our application's helpers to Administrate
    config.to_prepare do
      Administrate::ApplicationController.helper SprocketsLessRails::Application.helpers
    end
    config.active_job.queue_adapter = :sidekiq
    config.application_name = Rails.application.class.module_parent_name
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
