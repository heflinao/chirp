FactoryGirl.define do
  factory :favorite do
    user { FactoryGirl.create(:user) }
    tweet { FactoryGirl.create(:tweet) }
  end
end
