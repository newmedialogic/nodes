module Nodes
  module Provides

    def self.extended(base)
      all_models = Dir.glob( File.join(RAILS_ROOT, 'app', 'models', '*.rb')).map { |path| path[/.+\/(.+)\.rb/, 1] }
      all_models.each do |m|
        require m
      end

    end


    def provides_nodes(options = {}, &block)
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
