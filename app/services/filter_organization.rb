class FilterOrganization
  def initialize(params = {})
    @organizations = params[:organizations]
    @eligibilities = params[:eligibilities]
    @query_type = params[:q]
  end

  def call
    @query_type == "inclusive" ? inclusive_filter : exclusive_filter
  end

  private
    
  def inclusive_filter
    @organizations.select { |org| (org.eligibilities & @eligibilities).any? }
  end


  def exclusive_filter
    @organizations.select { |org| org.eligibilities & @eligibilities == @eligibilities }
  end
end