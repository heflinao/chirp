class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :tweet, index: true
      t.timestamps nil: false
    end
  end
end
