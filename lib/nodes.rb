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
