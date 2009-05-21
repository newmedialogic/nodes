require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'test/jeweler'

namespace :test do
  Rake::TestTask.new(:all) do |task|
    task.libs << "lib"
    task.libs << "test"
    task.pattern = "test/**/*_test.rb"
    task.verbose = false
  end
end

desc "Run the full test suite"
task :default => ["test:all"]


