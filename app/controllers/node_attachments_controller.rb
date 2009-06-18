class NodeAttachmentsController < ApplicationController

  before_filter :delegate_authorization


  def index
    @node_images = NodeImage.all
  end
  

  def show
    @node_image = NodeImage.find_by_id(params[:id])
  end
  

  def new
    @node_image = NodeImage.new
  end
  

  def create
    @node_image = NodeImage.new(params[:node_image])
    if @node_image.save
      flash[:message] = "Successfully created nodeimage."
      redirect_to node_images_url
    else
      render :action => 'new'
    end
  end
  

  def edit
    @node_image = NodeImage.find(params[:id])
  end
  

  def update
    @node_image = NodeImage.find(params[:id])
    @node_image.attributes = params[:node_image]
    if @node_image.save
      flash[:message] = "Successfully updated nodeimage."
      redirect_to node_images_url
    else
      render :action => 'edit'
    end
  end
  

  def destroy
    @node_image = NodeImage.find(params[:id])
    @node_image.destroy
    flash[:message] = "Successfully destroyed nodeimage."
    redirect_to node_images_url
  end

private

  def delegate_authorization
    if respond_to?(:authorized_for_node_attachments?, true)
      authorized_for_node_attachments?
    end
  end

end
