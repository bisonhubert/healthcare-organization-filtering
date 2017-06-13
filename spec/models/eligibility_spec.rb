require 'rails_helper'

describe Eligibility, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it "validates uniqueness of name" do
      eligibility = FactoryGirl.build(:eligibility, name: "LGBT")
      expect(eligibility).to be_valid

      duplicate_eligibility = FactoryGirl.create(:eligibility, name: "LGBT")
      expect(eligibility).to_not be_valid
    end
  end
end
