class User
	$session = ""
	$user = ""
	$i = 1
attr_accessor :username, :password

def initialize(username, password)
	# puts "Can't be nil try again" if @username == nil || @password == nil
	@username = username
	@password = password
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
	tweet = Tweet.new($i, @username, time.inspect, tweet_input)
	puts "Welcome to your tweet: \n Tweet number: #{tweet.tweet_number}. \n Author: #{tweet.tweet_author}. \n Time: #{tweet.tweet_time}. \n Text: #{tweet.tweet_text}"
	$i += 1
end
end
