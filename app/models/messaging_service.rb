# frozen_string_literal: true

class MessagingService < ApplicationRecord
  validates :alias_name, presence: true
  validates :webhook_url, presence: true, if: :slack?
  encrypts :webhook_url, :client_id, :client_secret

  enum provider: { slack: "slack" }
end
