
FactoryGirl.define do
  factory :promotion, :class => Refinery::Promotions::Promotion do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

