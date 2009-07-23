module Nodes
  module ManagesNodes
    module ClassMethods

      def manages_nodes(options = {}, &block)
        
        include Nodes::Controller::Base

        helper :nodes
        helper :blocks
        helper :node_comments

        helper_method :current_node
        helper_method :current_node_type
        helper_method :current_model_name

        before_filter :prepare_comment, :only => [:show]

      end
    end
  end
end


ActionController::Base.extend Nodes::ManagesNodes::ClassMethods
