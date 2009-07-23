class NodeCommentsController < ApplicationController
  
  before_filter :delegate_authorization


  def show
  end
  

  def new
  end
  

  def create
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
