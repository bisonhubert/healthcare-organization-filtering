require "rails_helper"

describe "Filtering organizations" do
  scenario "inclusive filter" do
    eligibility = FactoryGirl.create(:eligibility)
    other_eligibility = FactoryGirl.create(:eligibility, :update_name)
    organization = FactoryGirl.create(:organization, eligibilities: [eligibility])
    other_organization = FactoryGirl.create(:organization, eligibilities: [other_eligibility])
    excluded_organization = FactoryGirl.create(:organization)

    visit root_path

    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)

    check(eligibility.id)
    check(other_eligibility.id)
    click_button("Apply Filter")
    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)
    expect(page).not_to have_content(excluded_organization.name)
  end

  scenario "exclusive filter" do
    eligibility = FactoryGirl.create(:eligibility)
    other_eligibility = FactoryGirl.create(:eligibility, :update_name)
    organization = FactoryGirl.create(:organization, eligibilities: [eligibility, other_eligibility])
    other_organization = FactoryGirl.create(:organization, eligibilities: [other_eligibility])

    visit root_path

    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)

    check(eligibility.id)
    check(other_eligibility.id)
    choose("query_type_exclusive")
    click_button("Apply Filter")

    expect(page).to have_content(organization.name)
    expect(page).not_to have_content(other_organization.name)
  end
end