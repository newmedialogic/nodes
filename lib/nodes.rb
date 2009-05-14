# Nodes adds a minimalist content management system atop any
# Rails model.
# Author:: Aaron Longwell
# Copyright:: 2009 New Media Logic
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php) 
module Nodes

  VERSION = "0.1.0"

  @@node_classes = []
  mattr_accessor :node_classes

  # Eager loading. 
  def self.included(base) 
    base.extend ClassMethods 
    # base.send(:include, InstanceMethods) 


    all_models = Dir.glob( File.join( RAILS_ROOT, 'app', 'models', '*.rb') ).map{|path| path[/.+\/(.+).rb/,1] }
    ar_models = all_models.select{|m| m.classify.constantize < ActiveRecord::Base}.each do |m|
      require m
    end

    #
  end 


  module ClassMethods
   
    # +defines_nodes+ enhances the class its called on with CMS-related features. 
    # The following options customize this behavior:
    # * +type_names+: Either a String or an Array of Strings defining the
    # human-friendly names of the types of content this Class will manage. For
    # example, You might call defines_nodes :type_names => ['Article', 'Link', 'Album Review']
    # for a class called BlogPost.
    #
    def provides_nodes(options = {})
      Nodes.node_classes << self.type.name unless Nodes.node_classes.include?(self.type.name)
    end

  end

end

if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, Nodes)
end

if Object.const_defined?("ActionView")
  ActionView::Base.send(:include, BlocksHelper)
end


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
