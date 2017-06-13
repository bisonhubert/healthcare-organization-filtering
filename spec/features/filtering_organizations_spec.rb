require "rails_helper"

describe "Filtering organizations" do
  scenario "basic filter" do
    organization = FactoryGirl.create(:organization)
    other_organization = FactoryGirl.create(:organization, :update_single_eligibility)

    visit root_path

    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)

    check(1)
    click_button("Apply Filter")
    expect(page).to have_content(organization.name)
    expect(page).not_to have_content(other_organization.name)
  end

  scenario "inclusive filter" do
    organization = FactoryGirl.create(:organization)
    other_organization = FactoryGirl.create(:organization, :update_single_eligibility)

    visit root_path

    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)

    check(1)
    check(2)
    click_button("Apply Filter")
    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)
  end

  scenario "exclusive filter" do
    organization = FactoryGirl.create(:organization)
    other_organization = FactoryGirl.create(:organization, :update_multiple_eligibilities)

    visit root_path

    expect(page).to have_content(organization.name)
    expect(page).to have_content(other_organization.name)

    check(1)
    check(2)
    choose("query_type_exclusive")
    click_button("Apply Filter")

    expect(page).not_to have_content(organization.name)
    expect(page).to have_content(other_organization.name)
  end
end