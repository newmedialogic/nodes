module Nodes
  module Provides
    class Builder

      attr_accessor :node_title_method
      attr_accessor :node_body_method

      def initialize(model)
        @model = model

        # Default methods
        @node_title_method = :title
        @node_body_method  = :body
      end

      def apply
        @model.instance_variable_set("@node_title_method", self.node_title_method)
        @model.instance_variable_set("@node_body_method",  self.node_body_method)
      end

    end
  end
end
