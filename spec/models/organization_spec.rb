require "rails_helper"

describe Organization, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it "validates uniqueness of name" do
      organization = FactoryGirl.build(:organization, name: "Food Pantry")
      expect(organization).to be_valid

      duplicate_site = FactoryGirl.create(:organization, name: "Food Pantry")
      expect(organization).to_not be_valid
    end

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:eligibilities) }
  end

  it "saves eligibilities as lower-case" do
    mixed_case_eligibility = "gEnErIc ElIgIbIlItY"
    organization = FactoryGirl.create(:organization, eligibilities: [mixed_case_eligibility])
    expect(organization.eligibilities.first).eql?(mixed_case_eligibility.downcase)
  end
end
