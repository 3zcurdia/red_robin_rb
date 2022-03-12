# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :messaging_service

  scope :pending, -> { where(delivered_at: nil) }
  scope :delivered, -> { where.not(delivered_at: nil) }

  validates :recipient, :content, presence: true

  after_create_commit :deliver_message!

  def deliver_message!
    Message.transaction do
      notify!
      update!(delivered_at: DateTime.current)
    end
  end

  private

  def notify!
    messaging_service_client.notify!(recipient, content)
  end

  def messaging_service_client
    messaging_service.client
  end
end
