class User < ActiveRecord::Base
  require 'bcrypt'
  validates :username, presence: true
  has_secure_password
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy


  # actively follow another user
  # follower = who does this user follow
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

  # followed by another user
  # followed = who is this user followed by
  has_many :followed_by, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  # has many who are followed by this user
  # has_many :following, through: :follows, source: :followed
  has_many :following, through: :follows, source: :followed
  # has many who follow this user
  # has_many :followers, through: :followed_by, source: :follower
  has_many :followers, through: :followed_by, source: :follower

  # Example:
  #   <Follow id: 1, followed_id: 15, follower_id: 16>
  #   user 16 has user 15 as a follower
  #   user 15 follows user 16
end
