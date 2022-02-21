# frozen_string_literal: true

namespace :data_bus do
  desc "It listens the data bus for notification channels"
  task listen: :environment do
    puts "Start listening..."
    MessagingService.providers.map do |provider, _value|
      Thread.new { Subscriber.listen(provider) }
    end.map(&:join)
  end
end
