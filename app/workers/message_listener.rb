# frozen_string_literal: true

require "sneakers"

class MessageListener
  include Sneakers::Worker
  from_queue "red_robin.messages"

  def work(msg)
    logger.info "Recived: #{msg}"
    ack!
  end
end
