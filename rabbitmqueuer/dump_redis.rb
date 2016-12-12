require "redis"

REDIS = Redis.new
keys = REDIS.keys("*").sort

pp keys
