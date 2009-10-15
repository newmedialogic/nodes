module Nodes
  module Controller
    # Implements the standard, resourceful CRUD operations on 
    #
    module Actions

      # GET /things/new
      def new
        build_node
        instantiate_node
        render :new
      rescue ActionView::MissingTemplate
        render "nodes/new"
      end


      # POST /things
      def create
        build_node
        instantiate_node
        current_node.attributes = object_parameters
        if current_node.save
          save_succeeded!
          if respond_to?(:after_create)
            self.send(:after_create)
          else
            redirect_to (current_node.path.blank?) ? current_node : "/#{current_node.path}" and return
          end
        else
          save_failed!

          begin
            render :new and return
          rescue ActionView::MissingTemplate
            render "nodes/new" and return
          end
        end
      end
      

      # GET /things/4
      def show
        instantiate_node
        render :show
      rescue ActionView::MissingTemplate
        render "nodes/show"
      end


      # GET /things
      def index
        @nodes = current_model.all
        instance_variable_set("@#{instance_variable_name.pluralize.underscore}", @nodes)
        @node_type = current_node_type
        render :index
      rescue ActionView::MissingTemplate
        render "nodes/index"
      end


      # GET /things/12/edit
      def edit
        instantiate_node
        return unless node_is_editable?
        render :edit
      rescue ActionView::MissingTemplate
        render "nodes/edit"
      end


      # PUT /things/12
      def update
        instantiate_node
        return unless node_is_editable?
        current_node.attributes = object_parameters

        if current_node.save
          save_succeeded!

          if respond_to?(:after_update)
            self.send(:after_update)
          else
            redirect_to((current_node.path.blank?) ? @current_node : "/#{@current_node.path}") and return
          end
        else
          save_failed!
          begin
            render :edit
          rescue ActionView::MissingTemplate
            render "nodes/edit"
          end
        end
      end

      # DELETE /things/12
      def destroy
        instantiate_node
        return unless node_is_editable?
        if current_node.destroy
          redirect_to :action => :index
        else
          redirect_to :action => :index
        end
      end

    end
  end
end
