# frozen_string_literal: true

require "sneakers"

class MessageListener
  include Sneakers::Worker
  from_queue "red_robin.messages"

  def work(msg)
    data = JSON.parse(msg, symbolize_names: true) rescue {}

    case data
    in { uuid: uuid, recipient: recipient, content: content}
      logger.info "Recived: #{msg}"
    end
    ack!
  end
end
