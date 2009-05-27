module Nodes
  module Provides

    module ClassMethods

      def provides_nodes(options = {}, &block)
        send :include, InstanceMethods

        register_node_type
        add_model_associations

        builder = Nodes::Provides::Builder.new(self)
        builder.instance_eval(&block) if block_given?
        builder.apply
      end


      def provides_blocks(options = {}, &block)
        Nodes.block_classes << self.class unless Nodes.node_classes.include?(self.class)
      end

    private

      def add_model_associations
        has_one :node_abstract, :as => :node, :dependent => :destroy
      end

      def register_node_type
        Nodes.node_classes << self.class unless Nodes.node_classes.include?(self.class)
      end
    end


    module InstanceMethods

      DEFAULT_NODE_TITLE_METHOD = :title
      DEFAULT_NODE_BODY_METHOD  = :body

      def node_title
        title_method = (self.respond_to?(:node_title_method)) ? self.send(:node_title_method) : DEFAULT_NODE_TITLE_METHOD
        self.send(title_method)
      end

      def node_body
        body_method = self.respond_to?(:node_body_method) ? self.send(:node_body_method) : DEFAULT_NODE_BODY_METHOD
        self.send(body_method)
      end

      def path
        Time.now.to_formatted_s
      end

      def path=
      end

    end

  end
end


ActiveRecord::Base.extend Nodes::Provides::ClassMethods
