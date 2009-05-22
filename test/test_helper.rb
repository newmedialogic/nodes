################################################################################
# Rails Initialization
################################################################################
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/rails_root/config/environment')
require 'test_help'

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures = false
end

################################################################################
# Shoulda
# - Required only for testing
################################################################################
gem 'thoughtbot-shoulda'
require 'shoulda'

################################################################################
# Application/Gem Plugin
################################################################################
require 'nodes'


