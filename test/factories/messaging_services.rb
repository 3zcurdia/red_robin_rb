# frozen_string_literal: true

FactoryBot.define do
  factory :messaging_service do
    alias_name { "Company A Slack" }
    provider { "slack" }
    webhook_url { "http://example.com/slack" }

    trait :with_credentials do
      client_id { SecureRandom.hex }
      client_secret { SecureRandom.hex(32) }
    end
  end
end
