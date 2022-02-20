# frozen_string_literal: true

class SlackClient < MessagingClient
  def initialize(webhook_url)
    @webhook_url = webhook_url
  end

  def notify!(channel, message)
    notifier_for(channel).ping(message)
  end

  private

  attr_reader :webhook_url

  def notifier_for(channel)
    ::Slack::Notifier.new(webhook_url, channel:)
  end
end
