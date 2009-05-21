# Nodes adds a minimalist content management system atop any
# Rails model.
# Author:: Aaron Longwell
# Copyright:: 2009 New Media Logic
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php) 
module Nodes

  VERSION = "0.1.0"

  def self.node_classes
    @@node_classes ||= []
  end

  def self.node_classes=(node_classes)
    @@node_classes = node_classes
  end

end

require 'nodes/manages_nodes'
require 'nodes/provides'


# As of early May 2009, the default behaviors for Rails Engines
# is to initialize plugin routes BEFORE application routes, which is not the
# behavior we want. To fix this, we avoid using the convention to include
# a config/routes.rb file inside the plugin, and instead hack-in the routes
# we want using this bit of Monkey Patching (completely contained within the
# RouteSet override below).
#
# See http://giantrobots.thoughtbot.com/2009/4/23/tips-for-writing-your-own-rails-engine
# for more information. You'll find the plugin's routes in config/nodes_routes.rb
#
class ActionController::Routing::RouteSet

  def load_routes_with_nodes!
    lib_path = File.dirname(__FILE__)
    nodes_routes = File.join(lib_path, *%w[.. config nodes_routes.rb])

    RAILS_DEFAULT_LOGGER.error(configuration_files.join("\n"))

    unless configuration_files.include?(nodes_routes)
      add_configuration_file(nodes_routes)
    end
    
    load_routes_without_nodes!
  end

  alias_method_chain :load_routes!, :nodes

end
