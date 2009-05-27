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
          if current_node.save
            save_succeeded!
            redirect_to current_node and return
          else
            save_failed!
            render :new and return
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
          render :index
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

          begin
            result = current_node.update_attributes object_parameters
          rescue ActiveRecord::StaleObjectError
            current_node.reload
            result = false
          end

          if result
            save_succeeded!
            redirect_to current_node
          else
            save_failed!
            render :edit
          end
        end

        # DELETE /things/12
        def destroy
          instantiate_node
          if current_node.destroy
            response_for :destroy
          else
            response_for :destroy_failed
          end
        end

      end
    end
  end
end
