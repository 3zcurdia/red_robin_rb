# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :messaging_service

  scope :pending, -> { where(delivered_at: nil) }
  scope :delivered, -> { where.not(delivered_at: nil) }

  validates :recipient, :content, presence: true

  def delivered!
    update!(delivered_at: DateTime.current)
  end
end
