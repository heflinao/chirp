class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :followed_id, index: true
      t.integer :follower_id, index: true
      t.timestamps null: false
    end
  end
end
