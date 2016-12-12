require "bunny"
require "redis"

sleep 3

def log(msg)
  puts "#{CONSUMER_NAME}: #{msg}"
end

def maybe_store(body)
  if Random.new.rand(1..100) > 80
    log "uh oh, dropped #{body}"
  else
    REDIS.set(body, body)
    log "Stored #{body} in redis."
  end
end

CONSUMER_NAME = ENV.fetch("CONSUMER_NAME", "worker#{Random.new.rand(1..100)}")

REDIS = Redis.new(host: "redis")

RMQ_CONN = Bunny.new(host: "rabbitmq")
RMQ_CONN.start
RMQ_QUEUE = RMQ_CONN.create_channel.queue("hello")

RMQ_QUEUE.subscribe(block: true) do |delivery_info, properties, body|
  log "Received #{body}. Working..."
  maybe_store(body)
end
