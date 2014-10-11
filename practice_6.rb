require_relative 'User.rb'
require_relative 'Tweet.rb'

lily = User.new("lkaiser","pass",[])
lily.write_tweet("First tweet!")
lily.write_tweet("Second tweet!")

Tweet.summarize(2)