# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    recipient { "#pto_dev" }
    content { "This is a test" }
    messaging_service
  end
end
