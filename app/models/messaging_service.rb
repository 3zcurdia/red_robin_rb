# frozen_string_literal: true

class MessagingService < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :alias_name, presence: true
  validates :webhook_url, presence: true, if: :slack?
  encrypts :webhook_url, :client_id, :client_secret

  enum provider: { slack: "slack" }
end
