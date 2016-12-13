require "bunny"

RMQ_CONN = Bunny.new
RMQ_CONN.start
RMQ_CHAN = RMQ_CONN.create_channel
RMQ_QUEUE = RMQ_CHAN.queue(
  "durable_queue",
  durable: true, # Ensure queue is not lost on crash or reboot
)

(1..500).each do |e|
  puts e
  RMQ_QUEUE.publish(
    e.to_s.rjust(4, "0"),
    persistent: true, # Write messages to disk to avoid loss
  )
end

RMQ_CONN.close
