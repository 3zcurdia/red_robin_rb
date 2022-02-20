# frozen_string_literal: true

FactoryBot.define do
  factory :messaging_service do
    sequence(:alias_name) { |n| "Company #{n} Slack" }
    provider { "slack" }
    sequence(:webhook_url) { |n| "http://example.com/slack/#{n}" }

    trait :with_credentials do
      client_id { SecureRandom.hex }
      client_secret { SecureRandom.hex(32) }
    end
  end
end
