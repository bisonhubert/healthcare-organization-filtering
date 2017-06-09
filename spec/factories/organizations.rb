FactoryGirl.define do
  factory :organization do
    sequence(:name) { |i| "Organization #{i}" }
    description "This is a generic description."
    eligibilities ["Generic Eligibility Property"]
  end
end
