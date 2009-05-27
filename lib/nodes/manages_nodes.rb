module Nodes
  module ManagesNodes

    def self.extended(base)
      base.helper_method(:current_node)
    end

    def manages_nodes(options = {}, &block)
      include Nodes::Controller::Base
      add_helpers
    end

  private
  
    def add_helpers
      helper NodesHelper
      helper BlocksHelper
      helper_method(:current_node)
    end

  end
end


if Object.const_defined?("ActionController")
  ActionController::Base.extend Nodes::ManagesNodes
end
