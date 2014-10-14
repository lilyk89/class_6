class Tweet
	@@all_tweets = []
	$i = 0

	def self.all_tweets
		@@all_tweets
	end

	def self.summarize(n)
		@@all_tweets.each do |tweet|
			if tweet[:number] == n
				puts "Welcome to your tweet: \n
				Tweet number: #{tweet[:number]}. \n
				Author: #{tweet[:author]}. \n
				Time: #{tweet[:time]}. \n
				Text: #{tweet[:text]}.
				Likes: #{:likes}\n
				"
			end
		end
	end


# tweets don't have titles, pssh
attr_accessor :number, :author, :time, :text, :likes

def initialize(author, text)
	time = Time.new
	@number = $i
	@author = author
	@time = time.inspect
	@text = text
	@likes = []
	@@all_tweets.push(self)
	$i +=1
end

def count_likes
	@likes.count
end

end
