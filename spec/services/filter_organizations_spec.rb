require 'rails_helper'

describe "FilterOrganizations", type: :model do
  it "returns all organizations when no eligibilities are passed" do
    organization = FactoryGirl.create(:organization)

    organizations = FilterOrganizations.new({organizations: [organization]}).call
    expect(organizations.length).to be(1)
    expect(organization).to eq(organizations[0])
  end
end
