require "bunny"

CONSUMER_NAME = ENV.fetch("CONSUMER_NAME", "worker#{Random.new.rand(1..100)}")

puts "#{CONSUMER_NAME} sleeping to let RabbitMQ boot."
sleep 3
puts "#{CONSUMER_NAME} attempting to connect."


# CONNECTION = Bunny.new(host: "rabbitmq")
CONNECTION = Bunny.new(host: "rabbitmq")
CONNECTION.start

CHANNEL = CONNECTION.create_channel
QUEUE = CHANNEL.queue("hello")

puts "#{CONSUMER_NAME} Waiting for messages in #{QUEUE.name}."
QUEUE.subscribe(block: true) do |delivery_info, properties, body|
  puts "#{CONSUMER_NAME} Received #{body}. Sleeping..."
  sleep 1
  # cancel the consumer to exit
  # delivery_info.consumer.cancel
end
