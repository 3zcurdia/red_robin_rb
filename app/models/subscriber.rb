class Subscriber < BunnyClient
  def self.listen(routing_key, &block)
    subs = new(routing_key)
    subs.subscribe(&block)
    subs.listen
  end

  def subscribe
    queue.subscribe do |delivery_info, properties, payload|
      puts("[#{queue.name}] received: #{payload}")
      yield(delivery_info, properties, payload) if block_given?
    end
  end

  def listen
    loop {}
  ensure
    conn.stop
  end

  private

  def queue
    @queue ||= channel.queue("#{routing_key}.queue", auto_delete: true).bind(exchange, routing_key: routing_key)
  end
end
