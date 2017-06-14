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
        csv << [org.id, org.name, org.description, org.eligibilities, org.locations]
      end
    end
  end
end