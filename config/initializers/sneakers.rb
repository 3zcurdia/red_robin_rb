# frozen_string_literal: true

Sneakers.configure(heartbeat: 30,
                   amqp: ENV.fetch("CLOUDAMQP_URL", "amqp://guest@127.0.0.1:5672"),
                   vhost: "/",
                   exchange: "amq.direct",
                   exchange_type: :direct)

Sneakers.logger.level = Logger::INFO
