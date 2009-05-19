desc "Fixes stuff"
task :nodes => :environment do
  puts "Hello, world."
end


namespace :nodes do

  desc "Initializes your application to use the Nodes CMS system."
  task :initialize => :environment do
    puts "Nodes task."
  end

end
