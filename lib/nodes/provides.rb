module Nodes
  module Provides

    def self.extended(base)
    end


    def provides_nodes(options = {}, &block)

      has_one :node_abstract, :as => :node, :dependent => :destroy

      Nodes.node_classes << self.class unless Nodes.node_classes.include?(self.class)

    end


    def provides_blocks(options = {}, &block)
      Nodes.block_classes << self.class unless Nodes.node_classes.include?(self.class)
    end

  end
end


if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.extend Nodes::Provides
end
