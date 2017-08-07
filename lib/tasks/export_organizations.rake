task :export, [:eligibility] => :environment do |t, args|
  require 'csv_exporter'
  desc "it exports a CSV file"
    file = "organizations.csv"
    eligibility = args[:eligibility]
    CsvExporter.new({file: file, eligibility: eligibility}).export
end