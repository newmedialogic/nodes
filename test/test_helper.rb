ENV["RAILS_ENV"] = "test"

require File.expand_path(File.dirname(__FILE__) + '/rails_root/config/environment')

require 'test_help'

require 'nodes'

#gem 'thoughtbot-factory_girl'
require File.join(File.dirname(__FILE__), '..', 'shoulda_macros', 'nodes')

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures = false
end
