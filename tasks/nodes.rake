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

  desc "Generate and save all summaries."
  task :regen_summaries => :environment do
    begin
      NodeAbstract.all.each do |na|
        na.send(:generate_summary)
        na.save if na.changed?
      end
    rescue Exception => e
      puts "Error occurred on #{na.title}. #{e.message}"
    end
  end

end
