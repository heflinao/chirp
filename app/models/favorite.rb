class Favorite < ActiveRecord::Base
   belongs_to :user
   belongs_to :tweet

   def posted_by
     tweet.user.username
   end

   def posted_time
     tweet.posted_at
   end
end
