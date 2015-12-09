class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user, index: true, foreign_key: true
      t.text :body, limit: 140
    end
  end
end
