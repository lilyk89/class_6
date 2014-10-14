require_relative 'User.rb'
require_relative 'Tweet.rb'

loop do
puts "Welcome to the Fake Twitter Command Interface! \n
	Please type a command. \n
	Here are your options: \n
	sign_up \n
	sign_in \n
	sign_out \n
	write_tweet \n
	show_all"

command = gets.chomp()

	if command == "sign_up"
		puts "Please enter a username."
		username_input = gets.chomp()
		puts "Username recorded. Please enter a password."
		password_input = gets.chomp()
		user = User.new(username_input, password_input)
		puts "Your user account has been created."
	end

	if command == "sign_in"
		if $session == nil
			attempting_user = nil
			puts "Please enter your username."
			username_input = gets.chomp()
			User.all_users.each {|user| attempting_user = user if user.username == username_input}
			if attempting_user == nil
				puts "Not a registered user. Sign up first!"
			else puts "Username recorded. Please enter your password."
				password_input = gets.chomp()
				attempting_user.sign_in(username_input, password_input)
			end
		elsif $session != nil
			puts "#{$session.username} must sign out first."
		end
	end

	if command == "sign_out"
		if $session == nil
			puts "Sign in first silly"
		else $session.sign_out
		end
	end

	if command == "write_tweet"
		if $session == nil
			puts "Sign in first silly"
		else puts "Enter your tweet."
			tweet_input = gets.chomp()
			$session.write_tweet(tweet_input)
			T
		end
	end

	if command == "show_all"
		Tweet.show_all
	end

	if command != "sign_up" && command != "sign_in" && command != "sign_out" && command != "write_tweet" && command != "show_all"
	 	puts "Your command could not be recognized.\n
		Please select one of the options above."
	end 
end