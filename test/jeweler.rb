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
