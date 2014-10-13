class Tweet
	$history = []

	def self.show_all
		puts $history
	end

	def self.summarize(number)
		$history.each do |tweet|
			if tweet[:tweet_number] == number
				puts "Welcome to your tweet: \n
				Tweet number: #{tweet[:tweet_number]}. \n
				Author: #{tweet[:tweet_author]}. \n
				Time: #{tweet[:tweet_time]}. \n
				Text: #{tweet[:tweet_text]}"
			end
		end
	end


# tweets don't have titles, pssh
attr_accessor :tweet_number, :tweet_author, :tweet_time, :tweet_text

def initialize(tweet_number, tweet_author, tweet_time, tweet_text)
	@tweet_number = tweet_number
	@tweet_author = tweet_author
	@tweet_time = tweet_time
	@tweet_text = tweet_text
end

def store()
	$history.push({tweet_number:@tweet_number, tweet_author:@tweet_author, tweet_time:@tweet_time, tweet_text:@tweet_text})
end

end
