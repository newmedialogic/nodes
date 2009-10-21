class NodeAttachmentsController < ApplicationController

  before_filter :delegate_authorization


  def index
    @node_attachments = NodeAttachment.all
  end
  

  def show
    @node_attachment = NodeAttachment.find_by_id(params[:id])
    send_file(@node_attachment.file.path, :type => @node_attachment.file.content_type, :filename => @node_attachment.file.original_filename) and return
  end
  

  def new
    @node_attachment = NodeAttachment.new
  end
  

  def create
    @node_attachment = NodeAttachment.new(params[:node_attachment])
    if @node_attachment.save
      flash[:message] = "Successfully created nodeimage."
      redirect_to node_attachments_url
    else
      render :action => 'new'
    end
  end
  

  def edit
    @node_attachment = NodeAttachment.find(params[:id])
  end
  

  def update
    @node_attachment = NodeAttachment.find(params[:id])
    @node_attachment.attributes = params[:node_attachment]
    if @node_attachment.save
      flash[:message] = "Successfully updated nodeimage."
      redirect_to node_attachments_url
    else
      render :action => 'edit'
    end
  end
  

  def destroy
    @node_attachment = NodeAttachment.find(params[:id])
    @node_attachment.destroy
    flash[:message] = "Successfully destroyed nodeimage."
    redirect_to node_attachments_url
  end

private

  def delegate_authorization
    if respond_to?(:authorized_for_node_attachments?, true)
      authorized_for_node_attachments?
    end
  end

end
