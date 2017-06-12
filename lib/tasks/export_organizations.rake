task :export_organizations => :environment do 
  CSV.open("organizations.csv","w") do |csv|
    @organizations = Organization.all
    csv << ["ID", "Name", "Description", "Eligibilities", "Locations"]
    @organizations.each do |org|
      csv << [org.id, org.name, org.description, org.eligibilities, org.locations]
    end
  end
end