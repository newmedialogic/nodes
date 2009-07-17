namespace :nodes do

  desc "Repopulates missing node_abstract associations"
  task :create_missing => :environment do
    Nodes.node_classes.each do |clazz|
      clazz.all do |o|
        unless o.valid?
          puts "#{o} not valid. Skipping."
          next
        end
        o.save
      end
    end
  end
end
