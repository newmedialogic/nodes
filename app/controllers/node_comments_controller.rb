class NodeCommentsController < ApplicationController
  
  before_filter :delegate_authorization


  def show
  end
  

  def new
    @node_comment = NodeComment.new
  end
  

  def create
    @node_comment = NodeComment.new(params[:node_comment])
    # raise @node_comment.to_yaml
   
    if @node_comment.save
      redirect_to @node_comment.node 
    else
      render :action => 'new'
    end 
  end
  

  def edit
  end
  

  def update
  end
  

  def destroy
  end

  
private

  def delegate_authorization
    if self.respond_to?(:authorized_for_node_comments?, true)
      return authorized_for_node_comments?
    end
  end

end
