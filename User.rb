class User
	$session = ""
	$user = ""
	$i = 1

attr_accessor :username, :password, :tweet_history

def initialize(username, password, tweet_history)
	puts "Can't be nil try again" if username == nil || password == nil
	@username = username
	@password = password
	@tweet_history = tweet_history
end

def sign_in(username_input, password_input)
	message = ""
	message << "Incorrect username. " if username_input != @username
	message << "Incorrect password." if password_input != @password 
	if username_input == @username && password_input == @password
		message = "Login successful" 
		$session = self
		$user = self
	end					
end

def sign_out
	puts "Are you sure? Type y for yes and n for no."
	signout_input = gets.chomp()
	if signout_input == y
		$session = nil
		puts "Signout successful."
	else puts "You are still logged in."
	end
end

def write_tweet(tweet_input)
	time = Time.new
	this_tweet = Tweet.new($i, @username, time.inspect, tweet_input)
	@tweet_history.push({tweet_number:this_tweet.tweet_number, tweet_author:this_tweet.tweet_author, tweet_time:this_tweet.tweet_time, tweet_text:this_tweet.tweet_text})
	this_tweet.store()
	$i += 1
end

end
