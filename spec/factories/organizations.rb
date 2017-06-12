FactoryGirl.define do
  factory :organization do
    sequence(:name) { |i| "Organization #{i}" }
    description "This is a generic description."
    eligibilities ["Youth"]

    trait :update_single_eligibility do
      eligibilities ["LGBT"]
    end

    trait :update_multiple_eligibilities do
      eligibilities ["Youth", "LGBT", "Transgender"]
    end
  end
end
