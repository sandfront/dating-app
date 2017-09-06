class Cache
  include Singleton
  EXPIRE = 1.day

  def get(*args, &block)
    the_key = key(*args)
    if (value = $redis.get(the_key)).nil?
      value = yield(self)
      $redis.set(the_key, Marshal.dump(value))
      $redis.expire(the_key, EXPIRE)
      value
    else
      Marshal.load(value)
    end
  end

  def key(*args)
    "cache:#{args.join(":")}"
  end
end
