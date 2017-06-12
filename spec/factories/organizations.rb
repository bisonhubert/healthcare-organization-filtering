FactoryGirl.define do
  factory :organization do
    sequence(:name) { |i| "Organization #{i}" }
    description "This is a generic description."
    eligibilities ["Youth"]

    trait :update_eligibility do
      eligibilities ["LGBT"]
    end
  end
end
