class User < ActiveRecord::Base
  require 'bcrypt'
  validates :username, presence: true

  has_secure_password
end
