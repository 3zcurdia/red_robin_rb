# frozen_string_literal: true

class MessagingClient
  class UnsupportedClient < StandardError; end

  def self.build(messaging_service)
    case messaging_service.provider
    when "slack"
      SlackClient
    else
      raise UnsupportedClient
    end.new(**messaging_service.settings)
  end

  def notify!(_recipient, _content)
    raise NotImplementedError
  end
end
