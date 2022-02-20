# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  root "application#index"
  resources :messages, only: %i[index show destroy]
  resources :messaging_services

  scope :sidekiq do
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                  ::Digest::SHA256.hexdigest(ENV["ADMIN_USERNAME"])) &
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                    ::Digest::SHA256.hexdigest(ENV["ADMIN_PASSWORD"]))
    end

    mount Sidekiq::Web, at: "/"
  end
end
