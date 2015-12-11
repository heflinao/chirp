FactoryGirl.define do
  factory :follow do
    follower { FactoryGirl.create(:user) }
    followed { FactoryGirl.create(:user) }
  end
end
