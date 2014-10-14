class User
	$session = nil
	@@all_users = []

def self.all_users
	@@all_users
end

attr_accessor :username, :password, :tweet_history, :followers, :following

# def self.sign_up(username, password)
# 	User.new(username, password, [])
# end

def initialize(username, password)
	@username = username
	@password = password
	@tweet_history = []
	@followers = []
	@following = []
	@@all_users.push(self)
end

def sign_in(username_input, password_input)
	message = ""
	if $session == nil && username_input == @username && password_input == @password
		$session = self
		message = "Login successful"
	elsif $session != nil
		message << "#{@username} must sign out first."
	elsif $session == nil
		message << "Incorrect username." if username_input != @username
		message << "Incorrect password." if password_input != @password 
	end
	puts message			
end

def sign_out
	message = ""
	if $session != nil
		$session = nil
		message << "Sign out successful"
	else message << "Sign in first silly"
	end
	puts message
end

def write_tweet(tweet_input)
	if $session == nil
		puts "Sign in first"
	else a_tweet = Tweet.new(@username, tweet_input)
		@tweet_history.push(a_tweet.number)
	end
end

def like(n)
	if session == nil
		puts "Sign in first"
	else Tweet.all_tweets.each {|tweet| tweet.likes.push(@username) if tweet.number == n}
	end
end

def follow(username_to_follow)
	if session == nil
		puts "Sign in first"
	else
		@@all_users.each do |user|
			if user.username == username_to_follow
				user.followers.push(@username)
				@following.push(user.username)
			end
		end
	end
end

end
