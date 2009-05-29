module Nodes
  module Controller
    module Default
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
            redirect_to (current_node.path.blank?) ? current_node : "/#{current_node.path}" and return
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
          @nodes = []
          render :index
        rescue ActionView::MissingTemplate
          render "nodes/index"
        end


        # GET /things/12/edit
        def edit
          instantiate_node
          render :edit
        rescue ActionView::MissingTemplate
          render "nodes/edit"
        end


        # PUT /things/12
        def update
          instantiate_node
          current_node.attributes = object_parameters

          if current_node.save
            save_succeeded!
            redirect_to (current_node.path.blank?) ? current_node : "/#{current_node.path}" and return
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
          if current_node.destroy
            redirect_to :action => :index
          else
            redirect_to :action => :index
          end
        end

      end
    end
  end
end
