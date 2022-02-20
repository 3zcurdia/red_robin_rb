# frozen_string_literal: true

class MessagingClient
  class UnsupportedClient < StandardError; end

  def self.build(messaging_service)
    case messaging_service.provider
    when "slack"
      SlackClient.new(messaging_service.webhook_url)
    else
      raise UnsupportedClient
    end
  end

  def notify!(_recipient, _content)
    raise NotImplementedError
  end
end
