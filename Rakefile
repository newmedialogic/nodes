require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "nodes"
    gemspec.summary = "An unobtrusive content management plugin for Ruby on Rails."
    gemspec.email = "aaron@newmedialogic.com"
    gemspec.homepage = "http://github.com/adlongwell/nodes"
    gemspec.description = "An unobtrusive content management plugin for Ruby on Rails."
    gemspec.authors = ["Aaron Longwell"]
    gemspec.add_dependency('activesupport', '>2.3')

    # gemspec.rubyforge-project = "nodes"
  end
rescue LoadError
  puts "Jeweler not available. Install it with sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'nodes'

desc 'Default: run unit tests.'
task :default => [:clean, :test]

desc 'Test nodes.'
Rake::TestTask.new(:test) do |t|
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
  rdoc.rdoc_files.include('lib/**/*.rb')
end
