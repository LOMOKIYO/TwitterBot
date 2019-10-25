require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "D9eVQsGaKuLmKXJrv1BiJ1XBf"
  config.consumer_secret     = "8jwuBadDa4ymPZnHbu5EyQCd61vMBE4NmYSMZ9yvcs3yrAViun"
  config.access_token        = "1048497210-drtG3mdGmSmBPHNf3UvnTFzi3QQTTXLugdsodDP"
  config.access_token_secret = "0FP7TrIj9xtzaTQWcNoWTpJiRfBnApQlQb1xljEnJvauV"
end

loop do
  File.open("data.txt", "r") do |bot|
    @bots = bot.read.split("\n")
  end
  tweet = @bots.sample
  sleep_time = 1800
  # sleep_time = 60 + rand(3600)
  t = Time.now
  puts "#{tweet} (#{t}) next (#{t + sleep_time})"

  client.update tweet

  sleep sleep_time
end