module Nodes
  module Provides

    module ClassMethods

      def provides_nodes(options = {}, &block)
        has_one :node_abstract, :as => :node, :dependent => :destroy
        send :include, InstanceMethods
        Nodes.node_classes << self.class unless Nodes.node_classes.include?(self.class)
      end


      def provides_blocks(options = {}, &block)
        Nodes.block_classes << self.class unless Nodes.node_classes.include?(self.class)
      end

    end


    module InstanceMethods
      def path
        "EIGHTEEN" 
      end

      def path=
      end

    end

  end
end


ActiveRecord::Base.extend Nodes::Provides::ClassMethods
