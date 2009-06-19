module Nodes
  module ManagesNodes

    def self.extended(base)
      base.helper_method(:current_node)
      base.send(:helper, NodesHelper)
      base.send(:helper, BlocksHelper)
    end

    def manages_nodes(options = {}, &block)
      include Nodes::Controller::Base
      add_helpers
    end

  private
  
    def add_helpers
      helper_method :current_node
      helper_method :current_node_type
      helper_method :current_model_name
    end

  end
end


if Object.const_defined?("ActionController")
  ActionController::Base.extend Nodes::ManagesNodes
end
