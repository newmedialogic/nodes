require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'test/jeweler'

namespace :test do
  Rake::TestTask.new(:all => ["generator:cleanup",
                              "generator:generate"]) do |task|
    task.libs << "lib"
    task.libs << "test"
    task.pattern = "test/**/*_test.rb"
    task.verbose = false
  end
end

generators = %w(nodes)

namespace :generator do
  
  desc "Cleans up the rails_root test app before running the generator"
  task :cleanup do
    generators.each do |generator|
      system "cd test/rails_root && ./script/destroy #{generator}"
    end
    
    require 'fileutils'
    test_db = "test/rails_root/db/test.sqlite3"
    test_db_template = "test/rails_root/db/test_original.sqlite3"
    FileUtils.rm(test_db) if File.exist?(test_db)
    FileUtils.cp(test_db_template, test_db)
  end

  desc "Run all generators for the rails_root test application"
  task :generate do
    generators.each do |generator|
      system "cd test/rails_root && ./script/generate #{generator} && rake db:migrate"
    end
  end

end


desc "Run the full test suite"
task :default => ["test:all"]


