# frozen_string_literal: true

class Publisher
  def self.push(routing_key, message)
    new(routing_key).push(message)
  end

  def initialize(routing_key)
    conn = Bunny.new(ENV.fetch("CLOUDAMQP_URL", "amqp://guest@127.0.0.1:5672"))
    conn.start
    @channel = conn.create_channel
    @routing_key = routing_key
  end

  def push(msg)
    exchange.publish(msg, routing_key:)
  end

  private

  attr_reader :channel, :routing_key

  def exchange
    @exchange ||= channel.direct("amq.direct")
  end
end
