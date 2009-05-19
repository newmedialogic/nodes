ENV["FAKE_RAILS_ROOT"] ||= File.expand_path(File.dirname(__FILE__) + '/../tmp/fakerails')


desc "Create a fake rails environment (if needed)"
task :create_fakerails do
  if not File.directory?(ENV['FAKE_RAILS_ROOT'])
    `rails #{ENV['FAKE_RAILS_ROOT']}`
  end
end
