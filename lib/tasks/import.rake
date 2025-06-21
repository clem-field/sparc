  require 'roo'
namespace :import do
  desc "Imports base controls file"
  task data: :environment do
    puts 'Importing Data'
    data = Roo::Spreadsheet.open('lib/800-53-r4.xlsx') #base control file
    headers = data.row(1)
    data.each_with_index do |row, idx|
      next if idx == 0 # skip header
    control_data = Hash[[headers, row].transpose]
    if Catalog.exists?(control_id: control_data['control_id'])
      puts "Control '#{control_data['control_id']}' already exists"
      next
    end

    controls = Catalog.new(control_data)
    puts "Saving Control #{controls.control_id}"
    controls.save
  end
end
end
