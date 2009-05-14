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
    gem.add_dependency('activesupport', '>2.3')

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

desc 'Clean up files.'
task :clean do |t|
  FileUtils.rm_rf "doc"
  FileUtils.rm_rf "tmp"
  FileUtils.rm_rf "pkg"
  FileUtils.rm "test/debug.log" rescue nil
end

spec = Gem::Specification.new do |s| 
  s.name              = "nodes"
  s.version           = Nodes::VERSION
  s.author            = "Aaron Longwell"
  s.email             = "aaron@newmedialogic.com"
  s.homepage          = "http://www.newmedialogic.com/plugins/nodes"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Beautifully simple CMS plugin for Rails."
  s.files             = FileList["README*",
                                 "LICENSE",
                                 "Rakefile",
                                 "init.rb",
                                 "{generators,lib,tasks,test,shoulda_macros}/**/*"].to_a
  s.require_path      = "lib"
  s.test_files        = FileList["test/**/test_*.rb"].to_a
  # s.rubyforge_project = ""
  s.has_rdoc          = true
  s.extra_rdoc_files  = FileList["README*"].to_a
  s.rdoc_options << '--line-numbers' << '--inline-source'
  s.add_development_dependency 'thoughtbot-shoulda'
  s.add_development_dependency 'mocha'
end
 
desc "Generate a gemspec file for GitHub"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

