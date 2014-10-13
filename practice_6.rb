require_relative 'User.rb'
require_relative 'Tweet.rb'

# lily = User.new("lkaiser","pass",[])
# lily.write_tweet("First tweet!")
# lily.write_tweet("Second tweet!")

user = User.new("","",[])

loop do
puts "Welcome to the Fake Twitter Control Interface! \n
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
		user = User.sign_up(username_input, password_input)
		puts "Your user account has been created."
	end
	#sign in doesn't work
	if command == "sign_in"
		puts "Please enter your username."
		username_input = gets.chomp()
		$all_users.each {|hash| user = username_input if hash[:username] == username_input}
		if user == ""
			puts "Not a registered user. Sign up first!"
			# these are the problem lines. My assumption is the problem is with the user being created in the if statement above and the program "forgetting" about it when the while loop loops
		else puts "Username recorded. Please enter your password."
			password_input = gets.chomp()
			user.sign_in(username_input, password_input)
		end
	end
	if command == "sign_out"
		if user == ""
			puts "Sign in first silly!"
		else user.sign_out
		end
	end
	if command == "write_tweet"
		puts "Enter your tweet."
		tweet_input = gets.chomp()
		user.write_tweet(tweet_input)
	end
	if command == "show_all"
		Tweet.show_all
	end
	if command != "sign_up" && command != "sign_in" && command != sign_out && command != write_tweet && command != show_all
	 	puts "Your command could not be recognized.\n
		Please select one of the options above."
	end 
end