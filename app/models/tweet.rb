class Tweet < ApplicationRecord
	validate :content, :user_name
	scope :unread, -> { where(removed_at: nil) }

	def mark_as_read
		update_attributes(removed_at: Time.now)
	end

	def self.log_tweets_for_user(current_user, user_name)
		current_user.twitter.user_timeline(user_name, {count: 30}).each do |tweet|
			unless Tweet.exists?(tweet_id: tweet.id)
				Tweet.create!(
					tweet_id: tweet.id,
					content: tweet.text,
					user_name: tweet.user.screen_name.downcase,
					posted_at: tweet.created_at
				)
			end
		end
	end
end
