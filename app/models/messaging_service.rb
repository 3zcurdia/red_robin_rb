# frozen_string_literal: true

class MessagingService < ApplicationRecord
  has_many :messages, dependent: :destroy

  store :settings, accessors: %i[webhook_url]

  validates :alias_name, presence: true
  validates :webhook_url, presence: true, if: :slack?

  encrypts :webhook_url

  enum provider: { slack: "slack" }

  def client
    @client ||= MessagingClient.build(self)
  end
end
