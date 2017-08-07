class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.filter_organizations({eligibilities: params[:eligibilities], query_type: params[:query_type]})
  end

  def show
    @organization = Organization.find(params[:id]).decorate
  end
end
