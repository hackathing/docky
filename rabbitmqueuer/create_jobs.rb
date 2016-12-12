require "bunny"

RMQ_CONN = Bunny.new
RMQ_CONN.start
RMQ_CHAN = RMQ_CONN.create_channel
RMQ_Q = RMQ_CHAN.queue("hello")

(1..500).each do |e|
  puts e
  RMQ_CHAN.default_exchange.publish(e.to_s, routing_key: RMQ_Q.name)
end

RMQ_CONN.close
