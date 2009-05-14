# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nodes}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Longwell"]
  s.date = %q{2009-05-14}
  s.description = %q{An unobtrusive content management plugin for Ruby on Rails.}
  s.email = %q{aaron@newmedialogic.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README",
     "README.textile",
     "Rakefile",
     "VERSION",
     "app/controllers/nodes_controller.rb",
     "app/helpers/blocks_helper.rb",
     "app/views/nodes/index.html.erb",
     "app/views/nodes/show.html.erb",
     "config/nodes_routes.rb",
     "lib/nodes.rb",
     "rails/init.rb",
     "test/helper.rb",
     "test/nodes_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/adlongwell/nodes}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{An unobtrusive content management plugin for Ruby on Rails.}
  s.test_files = [
    "test/helper.rb",
     "test/nodes_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["> 2.3"])
    else
      s.add_dependency(%q<activesupport>, ["> 2.3"])
    end
  else
    s.add_dependency(%q<activesupport>, ["> 2.3"])
  end
end
