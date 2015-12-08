class Tweet < ActiveRecord::Base
  validates :body, length: { maximum: 140, minimum: 1 }
end
