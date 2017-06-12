class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    
    @eligibilities_list = ["Youth", "LGBT", "Seniors", "Veterans", "HIV Positive", "Transgender", "Homeless", "Female", "Young Adult", "Allies", "Lesbian", "Gay", "Adult", "Bilingual"]
    
    if params[:eligibilities]
      @organizations = FilterOrganizations.new({organizations: @organizations, eligibilities: params[:eligibilities]}).filter_by_or
    end
  end

  def show
    @organization = Organization.find(params[:id]).decorate
  end
end
