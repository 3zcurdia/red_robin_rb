# frozen_string_literal: true

class Publisher < BunnyClient
  def self.push(routing_key, message)
    new(routing_key).push(message)
  end

  def push(msg)
    exchange.publish(msg, routing_key:)
  end
end
