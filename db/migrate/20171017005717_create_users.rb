class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uuid
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
