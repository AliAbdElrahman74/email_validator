class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.throttle('request IP', limit: 5, period: 1) do |req|
    req.ip
  end

end
