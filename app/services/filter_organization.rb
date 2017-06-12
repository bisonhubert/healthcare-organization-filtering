class FilterOrganization
  def initialize(params)
    @organizations = params[:organizations]
    @eligibilities = params[:eligibilities]
    @query_type = params[:q]
  end

  def call
    @query_type == 'inclusive' ? inclusive_filter : exclusive_filter
  end

  private
    
  def inclusive_filter
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

  def exclusive_filter
    filtered_organizations = []
    @organizations.each do |organization|
      if organization.eligibilities.sort == @eligibilities.sort
        filtered_organizations.push(organization)
      end
    end
    filtered_organizations
  end
end