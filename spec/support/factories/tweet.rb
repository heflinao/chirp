FactoryGirl.define do
  factory :tweet do
    sequence(:body) { |n| "Humid uc coffee emporium music hall city chili midpoint music festival fift#{n}" }
  end
end
