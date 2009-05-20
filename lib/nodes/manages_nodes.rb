module Nodes
  module ManagesNodes

    def self.extended(base)
    end

    def manages_nodes(options = {}, &block)
      include Nodes::Controller::Base
      add_helpers
    end

  private
  
    def add_helpers
      helper_method(:node_type)
    end

  end
end
