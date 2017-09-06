$redis = Redis.new

url = ENV["REDISCLOUD_URL"]
# url = ENV['REDIS_PORT_6379_TCP_ADDR'] || '0.0.0.0',

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
