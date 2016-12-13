require "redis"
require "pp"

REDIS = Redis.new
keys = REDIS.keys("*").sort

pp keys
