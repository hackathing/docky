require "bunny"
require "redis"

sleep 3

def log(msg)
  puts "#{CONSUMER_NAME}: #{msg}"
end

CONSUMER_NAME = ENV.fetch("CONSUMER_NAME", "worker#{Random.new.rand(1..100)}")

REDIS = Redis.new(host: "redis")

RMQ_CONN = Bunny.new(host: "rabbitmq")
RMQ_CONN.start
RMQ_CHAN = RMQ_CONN.create_channel
RMQ_QUEUE = RMQ_CHAN.queue(
  "durable_queue",
  durable: true, # Ensure queue is not lost on crash or reboot
)

# Don't dispatch a new message to a worker until it has processed and
# acknowledged the previous one. Free workers get jobs.
# RMQ_CHAN.prefetch(1) # When I enable this the consumers never get the first
                       # msg. Why is this?

args = {
  block: true,
  manual_ack: true, # Don't remove from queue unless job success ACK recieved
}

RMQ_QUEUE.subscribe(args) do |delivery_info, properties, body|
  log "Received #{body}. Working..."

  if Random.new.rand(1..100) > 80
    log "uh oh, dropped #{body}"
  else
    REDIS.set(body, body)
    RMQ_CHAN.ack(delivery_info.delivery_tag)
    log "Stored #{body} in redis."
  end
end
