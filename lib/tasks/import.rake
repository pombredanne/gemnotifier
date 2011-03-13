namespace :import do
  
  desc "Gems list"
  task :gems_list => :environment do
    gems_list_file_path = File.join(Rails.root, 'lib/gems.list')
    gems_list_file = File.open(gems_list_file_path)
    gems_list_file.each do |line|
      gem_name, gem_version = line.split(' ')
      gem_version = gem_version.gsub(/\(|\)/, '')
      gem_item = GemItem.where(:name => gem_name).first
      if gem_item.nil?
        GemItem.create({
          :name => gem_name,
          :version => gem_version
        })
        puts "save #{gem_name} into db."
      end
    end
  end
  
  desc "Load Gem Info"
  task :load_gem_info => :environment do
    where_opt = ENV['from_id'].present? ? "id > #{ENV['from_id']}" : {}
    GemItem.where(where_opt).find_each do |gem_item|
      response = HTTParty.get("http://rubygems.org/api/v1/gems/#{gem_item.name}.json")
      gem_hash = ActiveSupport::JSON.decode(response.body)
      gem_item.update_attributes(gem_hash)
      puts "Updated gem: #{gem_item.name}."
    end
  end
  
end