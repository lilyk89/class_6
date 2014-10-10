class Tweet

# tweets don't have titles, pssh
attr_accessor :tweet_number, :tweet_author, :tweet_time, :tweet_text

def initialize(tweet_number, tweet_author, tweet_time, tweet_text)
	@tweet_number = tweet_number
	@tweet_author = tweet_author
	@tweet_time = tweet_time
	@tweet_text = tweet_text
end

end
