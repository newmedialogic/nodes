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


load 'nodes/manages_nodes.rb'
load 'nodes/provides.rb'



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
    new_routes = File.expand_path(File.join(lib_path, *%w[.. config nodes_routes.rb]))

    unless configuration_files.include?(new_routes)
      add_configuration_file(new_routes)
      # raise configuration_files.join("")
    end
    
    load_routes_without_nodes!
  end

  alias_method_chain :load_routes!, :nodes

end



# Make all paths of this plugins code not "load-once" style
# paths (meaning their code is reloaded on every request in
# development mode).
#
['lib', 'app/models', 'app/controllers', 'app/helpers', 'app/metal'].each do |dir|
  root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  path = File.join(root, dir)
  ActiveSupport::Dependencies.load_paths << path unless ActiveSupport::Dependencies.load_paths.include?(path)
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end

