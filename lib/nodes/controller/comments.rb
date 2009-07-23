module Nodes
  module Controller
    module Comments

      def prepare_comment
        @node = current_node
        @node_comment = NodeComment.new(:node => @node)
      end

    end
  end
end
