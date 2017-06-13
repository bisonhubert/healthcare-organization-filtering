FactoryGirl.define do
  factory :eligibility do
    name "Seniors"
  end

  trait :update_name do
    name "LGBT"
  end
end