FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foo#{n}" }
    password "password10"
    password_confirmation "password10"
  end
end
