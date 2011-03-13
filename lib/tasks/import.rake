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
  
end