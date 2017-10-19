class TweetsController < ApplicationController
	before_action :authenticate_access

	def search
	end

	def index
		redirect_to '#search'
	end

	def show
	end

	def list
		@user_name = params[:user_name].downcase
		begin
			Tweet.log_tweets_for_user(current_user, @user_name)
			@tweets = Tweet.where(user_name: @user_name).unread
		rescue Twitter::Error::NotFound
			redirect_to root_url, flash: { :error => "Oops, that is not a valid Twitter account" }
		end
	end

	def mark_as_read
		@tweet = Tweet.where(id: params[:id]).first.update_attributes(removed_at: Time.now)
		redirect_back(fallback_location: root_path)
	end
end