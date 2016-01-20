class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { maximum: 140, minimum: 1 }

  def user
    User.find(user_id)
  end

  def posted_at
    created_at.strftime("%m/%d/%Y")
  end

  def favorited?(user)
    Favorite.where(user: user, tweet: self).any?
  end

  def favorite(user)
    Favorite.find_by(user: user, tweet: self)
  end
end
