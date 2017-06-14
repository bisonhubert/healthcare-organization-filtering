class CsvExporter
  def initialize(params = {})
    @file = params[:file]
    @eligibility = params[:eligibility] ? [params[:eligibility]] : nil
  end

  def export
    create_csv
  end

  private

  def create_csv
    CSV.open(@file, "w") do |csv|
      @organizations = Organization.filter_organizations({eligibilities: @eligibility})
      csv << ["ID", "Name", "Description", "Eligibilities", "Locations"]
      @organizations.each do |org|
        eligibilities = get_elegibilities(org.eligibilities)
        locations = get_location_info(org.locations)
        csv << [org.id, org.name, org.description, eligibilities, locations]
      end
    end
  end

  def get_elegibilities(elegibilities)
    elegibilities.map(&:name)
  end

  def get_location_info(locations)
    locations.map do |location| 
      {
        name: location.name, 
        address: location.address, 
        city: location.city, 
        state: location.state, 
        zipcode: location.zipcode 
      }
    end
  end
end