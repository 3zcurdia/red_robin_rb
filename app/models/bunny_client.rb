# frozen_string_literal: true

class BunnyClient
  def initialize(routing_key)
    @routing_key = "red_robin.#{routing_key}"
    @conn = Bunny.new(ENV.fetch("CLOUDAMQP_URL", "amqp://guest@127.0.0.1:5672"))
    start
  end

  protected

  attr_reader :conn, :channel, :routing_key

  def exchange
    @exchange ||= channel.direct("amq.direct", type: :direct, durable: true, auto_delete: false)
  end

  private

  def start
    conn.start
    @channel = conn.create_channel
  end
end
