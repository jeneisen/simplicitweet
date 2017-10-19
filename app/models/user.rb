class User < ActiveRecord::Base
  has_secure_token :token
  has_secure_token :secret

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uuid: auth_hash.uid).first_or_create
    user.update_attributes(
      name: auth_hash.info.nickname,
      token: auth_hash.credentials.oauth_token,
      secret: auth_hash.credentials.oauth_token_secret
    )
    user
  end

  def twitter
  	if provider == "twitter"
  		@client ||= Twitter::REST::Client.new do |config|
	      config.consumer_key        = ENV['TWITTER_KEY']
	      config.consumer_secret     = ENV['TWITTER_SECRET']
	      config.access_token 			 = token
	      config.access_token_secret = secret
  		end
  	end
  end
end
