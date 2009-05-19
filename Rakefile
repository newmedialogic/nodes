require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'test/jeweler'
require 'test/fake_rails_root'


ENV['RAILS_ROOT'] ||= ENV['FAKE_RAILS_ROOT']
ENV['RAILS_ENV'] ||= 'test'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'nodes'



desc 'Default: run unit tests.'
task :default => [:clean, :test]



desc 'Create Rails test application.'
task :create_rails_test_app do

  if not File.directory?(ENV['FAKE_RAILS_ROOT'])
    `rails #{ENV['FAKE_RAILS_ROOT']}`
  end

end


desc 'Test nodes.'
Rake::TestTask.new(:test => [:create_rails_test_app, :environment]) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


desc 'Start an IRB session with all necessary files required.'
task :shell do |t|
  chdir File.dirname(__FILE__)
  exec 'irb -I lib/ -I lib/paperclip -r rubygems -r active_record -r tempfile -r init'
end

desc 'Generate documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Nodes'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include(['lib/**/*.rb', 'app/**/*.rb'])
end
