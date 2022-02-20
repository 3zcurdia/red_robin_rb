# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :messaging_service

  scope :pending, -> { where(delivered_at: nil) }
  scope :delivered, -> { where.not(delivered_at: nil) }

  validates :recipient, :content, presence: true

  after_create_commit :send_message_later

  def deliver!
    Message.transaction do
      messaging_service_client.notify!(recipient, content)
      update!(delivered_at: DateTime.current)
    end
  end

  private

  def send_message_later
    MessageSenderJob.perform_later(self)
  end

  def messaging_service_client
    messaging_service.client
  end
end
