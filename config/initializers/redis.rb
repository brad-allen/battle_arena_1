#$redis = Redis.new(url: ENV["REDIS_URL"])

uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => uri)
#uri = URI.parse(ENV["REDISTOGO_URL"])
#REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

#$redis = Redis::Namespace.new("ihms_env_app", :redis => Redis.new)

#uri = URI.parse(ENV["REDISTOGO_URL"])
#REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
