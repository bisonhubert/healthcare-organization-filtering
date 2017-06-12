class FilterOrganizations
  def initialize(params)
    @organizations = params[:organizations]
    @eligibilities = params[:eligibilities]
  end

  def filter_by_or
    filtered_organizations = []
    @organizations.each do |organization|
      organization.eligibilities.each do |eligibility|
        if @eligibilities.include?(eligibility)
          filtered_organizations.push(organization)
        end
      end
    end
    filtered_organizations
  end
end