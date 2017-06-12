class CsvExporter
  def export(params = {})
    @file = params[:file]
    @eligibility = [params[:eligibility]]
    CSV.open(@file, "w") do |csv|
      @organizations = Organization.all
      if @eligibility.any?
        @organizations = filtered_organizations
      end
      csv << ["ID", "Name", "Description", "Eligibilities", "Locations"]
      @organizations.each do |org|
        csv << [org.id, org.name, org.description, org.eligibilities, org.locations]
      end
    end
  end

  private

  def filtered_organizations
    @eligibility ? FilterOrganization.new({organizations: @organizations, eligibilities: @eligibility}).call : @organizations
  end
end

task :export, [:eligibility] => :environment do |t, args|
  desc "it exports a CSV file"
    file = "organizations.csv"
    eligibility = args[:eligibility]
    CsvExporter.new.export({file: file, eligibility: eligibility})
end