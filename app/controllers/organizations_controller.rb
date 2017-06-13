class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.filter_organizations({eligibilities: params[:eligibilities], query_type: params[:query_type]})

    @eligibilities_list = ["Youth", "LGBT", "Seniors", "Veterans", "HIV Positive", "Transgender", "Homeless", "Female", "Young Adult", "Allies", "Lesbian", "Gay", "Adult", "Bilingual"]
  end

  def show
    @organization = Organization.find(params[:id]).decorate
  end
end
