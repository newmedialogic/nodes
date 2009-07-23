module Nodes
  module Controller
    module Comments

      def prepare_comment
        @node = current_node
        @node_comment = NodeComment.new(:node => @node)

        user = send(current_user_method)
        @node_comment.user = user
        @node_comment.author = user.send(user_name_method)
        @node_comment.email = user.send(user_email_method)
      end


      def current_user_method
        :current_user
      end

      def user_name_method
        :name
      end

      def user_email_method
        :email
      end

    end
  end
end
