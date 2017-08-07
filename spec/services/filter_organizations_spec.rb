require 'rails_helper'

describe "FilterOrganizations", type: :model do
  it "returns all organizations when no eligibilities are passed" do
    organization = FactoryGirl.create(:organization)

    organizations = FilterOrganizations.new({organizations: [organization]}).call

    expect(organizations.length).to be(1)
    expect(organizations).to include(organization)
  end

  it "filter includes organizations with selected elegibilities" do
    eligibility = FactoryGirl.create(:eligibility)
    other_eligibility = FactoryGirl.create(:eligibility, :update_name)
    organization = FactoryGirl.create(:organization, eligibilities: [eligibility])
    other_organization = FactoryGirl.create(:organization, eligibilities: [other_eligibility])
    excluded_organization = FactoryGirl.create(:organization)

    organizations = FilterOrganizations.new({organizations: [organization, other_organization], eligibilities: [eligibility.name, other_eligibility.name], query_type: "inclusive"}).call

    expect(organizations.length).to be(2)
    expect(organizations).to include(organization)
    expect(organizations).to include(other_organization)
    expect(organizations).not_to include(excluded_organization)
  end

  it "filter excludes organizations without selected eligibilities" do
    eligibility = FactoryGirl.create(:eligibility)
    other_eligibility = FactoryGirl.create(:eligibility, :update_name)
    organization = FactoryGirl.create(:organization, eligibilities: [eligibility, other_eligibility])
    other_organization = FactoryGirl.create(:organization, eligibilities: [other_eligibility])

    organizations = FilterOrganizations.new({organizations: [organization, other_organization], eligibilities: [eligibility.name, other_eligibility.name]}).call

    expect(organizations.length).to be(1)
    expect(organizations).to include(organization)
    expect(organizations).not_to include(other_organization)
  end
end
