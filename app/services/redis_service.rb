class RedisService
  def self.fetchex(key, expiry)
    redis = Redis.new
    resp = redis.get(key)
    if !resp
      redis.setex(key, expiry, yield)
    end
    return resp
  end
end
