# frozen_string_literal: true

class MessageSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.deliver!
  end
end
