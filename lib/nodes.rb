# Nodes adds a minimalist content management system atop any
# Rails model.
# Author:: Aaron Longwell
# Copyright:: 2009 New Media Logic
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php) 
module Nodes

  VERSION = "0.1.0"

  module ClassMethods
   
    # +defines_nodes+ enhances the class its called on with CMS-related features. 
    # The following options customize this behavior:
    # * +type_names+: Either a String or an Array of Strings defining the
    # human-friendly names of the types of content this Class will manage. For
    # example, You might call defines_nodes :type_names => ['Article', 'Link', 'Album Review']
    # for a class called BlogPost.
    #
    def defines_nodes(options = {})

    end

  end

end

if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, Nodes)
end
