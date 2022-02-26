# frozen_string_literal: true

Sneakers.configure(heartbeat: 30,
                   connection: Bunny.new(ENV.fetch("CLOUDAMQP_URL", "amqp://guest@127.0.0.1:5672")),
                   exchange: "amq.direct",
                   exchange_type: :direct)

Sneakers.logger.level = Logger::INFO
