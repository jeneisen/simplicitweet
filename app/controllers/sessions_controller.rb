class SessionsController < ApplicationController
	def create
		@user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id] = @user.id
		redirect_to root_path
	end

	def destroy
		if current_user
			session.delete(:user_id)
			flash[:success] = "Successfully logged out"
		end
		redirect_to root_path
	end

	def auth_fail
		redirect_to root_path
		flash[:failure] = "Sorry there has been a problem logging you in. Check https://status.twitterstat.us/ "
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end