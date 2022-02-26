# frozen_string_literal: true

class SlackClient < MessagingClient
  def initialize(**args)
    @webhook_url = args[:webhook_url]
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
