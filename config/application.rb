# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RedRobin
  class Application < Rails::Application
    config.middleware.use Rack::Deflater
    config.load_defaults 7.0
    # config.time_zone = "Central Time (US & Canada)"
    config.active_job.queue_adapter = :sneakers
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
