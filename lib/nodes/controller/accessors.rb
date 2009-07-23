module Nodes
  module Controller
    module Accessors

    protected

      def build_node
        @current_node = current_model.new
      end


      def current_node
        @current_node ||= current_model.find_by_id(params[:id]) || current_model.find(:first, :include => "node_abstract", :conditions => ["node_abstracts.path = ?", "#{current_model_name.tableize}/#{params[:id]}"])
      end


      def instantiate_node
        instance_variable_set("@#{instance_variable_name.singularize}", current_node)
        instance_variable_set("@node", current_node)
        instance_variable_set("@node_type", current_node_type)
      end


      def instance_variable_name
        controller_name
      end


      def current_node_type
        current_model_name
      end


      def current_model_name
        controller_name.singularize.camelize
      end


      def current_model
        current_model_name.constantize
      end


      def object_parameters
        params[current_model_name.underscore]
      end


      def save_succeeded!
        @save_succeeded = true
      end


      def save_failed!
        @save_succeeded = false
      end

    end
  end
end
