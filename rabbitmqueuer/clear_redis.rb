require "redis"

REDIS = Redis.new
num_deleted = REDIS.keys.each do |key|
  REDIS.del(key)
end.size

puts "Deleted #{num_deleted} keys"
