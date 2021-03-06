class FilterOrganizations
  def initialize(params = {})
    @organizations = params[:organizations]
    @eligibilities = params[:eligibilities]
    @query_type = params[:query_type]
  end

  def call
    @eligibilities.nil? ? @organizations : apply_filter
  end

  private

  def apply_filter
    @query_type == "inclusive" ? inclusive_filter : exclusive_filter
  end
    
  def inclusive_filter
    @organizations.select { |org| (get_eligibility_names(org.eligibilities) & @eligibilities).any? }
  end


  def exclusive_filter
    @organizations.select { |org| get_eligibility_names(org.eligibilities) & @eligibilities == @eligibilities }
  end

  def get_eligibility_names(eligibilities)
    eligibilities.map(&:name)
  end
end