module Nodes::Controller

  def self.included(base)
    base.send(:include, Nodes::Controller::Authorization)
    base.helper [:blocks, :nodes, :node_comments]
    base.extend(ClassMethods)
  end


  module ClassMethods

    def manages_nodes(options = {}, &block)
      
      include Nodes::Controller::Base

      helper :blocks

      helper_method :current_node
      helper_method :current_node_type
      helper_method :current_model_name

      before_filter :prepare_comment, :only => [:show]
    end

  end

end
