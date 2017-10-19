Simplicitweet
===================


### App
Simplicitweet is a Ruby on Rails web app that allows users to search and read tweets (the latest 30) by a specific handle and mark tweets as read such that those that are read will not appear again in search.

### Responsibilities

 - Has a very basic user system.
 - Examines the Twitter API such that it can pull in tweets for a given user/handle.
 - Displays ingested tweets on a page.
 - Allows a user to mark tweets as “READ”
 
### Dependencies
- Ruby version `>= 2.2.2`
- Rails version `>= 5`

### Gems
- [twitter](https://github.com/sferik/twitter)
- [omniauth-twitter](https://github.com/arunagw/omniauth-twitter)
- [bootstrap-sass](https://github.com/twbs/bootstrap-sass)

### Database
- Sqlite3 with Rails ActiveRecord

### Setup for running locally & Testing the app
Prereqs for running the app:
- If you would like to run application locally, please set required `ENV` variables: `TWITTER_KEY` and `TWITTER_SECRET` by creating a `.env` file and putting the key and secrets in there. Be sure to add `.env` to your `.gitignore` file
- setup a new application on the [Twitter application developer portal](https://apps.twitter.com/) with the following settings:
- readonly permissions
- `callback_url` = `http://localhost:9000/auth/twitter/callback`
- click `Allow this application to be used to Sign in with Twitter`

Running the app:
`git clone ` into desired folder  
`cd simplicitweet`  
`bundle install`  
`bin/rake db:migrate`  
`bin/rails server`  
open a browser window and navigate to `http://localhost:9000/`  
signup through Twitter  
[![Screen_Shot_2017-10-18_at_11.21.15_PM.png](https://s1.postimg.org/6ik711klpb/Screen_Shot_2017-10-18_at_11.21.15_PM.png)](https://postimg.org/image/8ojlmtc9gb/)  
enter valid Twitter handle  
[![Screen_Shot_2017-10-18_at_11.19.51_PM.png](https://s1.postimg.org/7zqc2sob0f/Screen_Shot_2017-10-18_at_11.19.51_PM.png)](https://postimg.org/image/6bgz5ly0u3/)  
view latest tweets   
[![Screen_Shot_2017-10-18_at_11.20.59_PM.png](https://s1.postimg.org/1sey2msrm7/Screen_Shot_2017-10-18_at_11.20.59_PM.png)](https://postimg.org/image/3yecoekfd7/) 

### Development

##### Models
- User
	- ```User(id: integer, provider: string, uuid: string, name: string, token: string, secret: string, created_at: datetime, updated_at: datetime)```
- Tweet
	- ```Tweet(id: integer, tweet_id: string, user_name: string, content: text, removed_at: datetime, posted_at: datetime, created_at: datetime, updated_at: datetime)```

##### sample TODO items
- add pagination for tweets
- add additional error messages for unauthorized state
- encrypt tokens saved on User
- cache tweets so not hitting Twitter API every search
- dockerize rails application
- Testing (Rspec)
- Deploy to Heroku
- add support for additional logins (facebook, google etc)

##### Architecture Improvements
There are various options for datastores. To mitigate the issue of storing all tweets in the database in the future I’d consider options like a front end solution where we could use a local store or browser cookies depending on the size of the data. I’d also consider a frontend/backend solution like CouchDB that would keep the local and server store in sync. There are many other options to consider to improve performance and db strain in the future.

### Issues
Please create a Github issue if you identify any problems or have suggestions for improvements or contact me directly.

### Useful Links
- [Twitter API docs](https://developer.twitter.com/en/docs)
- [Twitter status](https://status.twitterstat.us/)
