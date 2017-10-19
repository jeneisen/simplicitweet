class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :user_name
      t.text :content
      t.timestamp :removed_at
      t.timestamp :posted_at

      t.timestamps
    end
  end
end
