class NodesController < ApplicationController

  before_filter :assemble_blocks
  helper :blocks

  prepend_view_path "app/pages"
  append_view_path "app/blocks"


  def new
    @node_type = node_type
    @node = @node_type.new 
    render 'new' and return
  end


  def create
    @node_type = params[:node_type].classify.constantize
    @node = @node_type.new(params[:node])
    if @node.save
      redirect_to @node
    else
      render :new
    end
  end


  def index
    @node_type = node_type
    @nodes = @node_type.all
    render 'index' and return
  end


  def show

    path_parts = params[:path].dup

    loop do
      path = path_parts.join("/")

      if node_management_path?(path)
        return handle_node_management_request()
      elsif template = template_for_path(path)
        return render_static_path(template)
      elsif @node = node_for_path(path)
        return render_node(@node)
      else
        raise ActiveRecord::RecordNotFound
      end

      path_parts.pop
      break if path_parts.size < 1
    end

  end

private

  def handle_node_management_request()
    case params[:path].last
    when 'new': return new
    when 'edit': return edit
    else
      return index
    end
  end


  def node_type
    return nil if params[:path].nil? or params[:path].empty?
    params[:path].first.singularize.classify.constantize
  end


  def node_management_path?(path)

    if path =~ /pages/
      return true
    else
      return false
    end
  end
  
  def node_for_path(path)
    @abstract = NodeAbstract.find_by_path(path)
    return nil if @abstract.nil?
    return @abstract.node
  end


  # This method should be moved into a Mixin that's included into ActionController::Base
  # and ActionView::Base (copy the methods used by render() in both cases).
  #
  def render_node(node)
    @page = node
    render :template => "/#{node.class.name.pluralize.downcase}/show"
  end


  def render_static_path(path)
    render :template => path, :layout => determine_layout and return
  end


  def determine_layout
    "application"
  end


  def template_for_path(path)
    
    index_path = [path, 'index'].join('/')

    return path       if template_exists?(path)
    return index_path if template_exists?(index_path)
    return nil
  end


  def template_exists?(path)
    self.view_paths.find_template(path, response.template.template_format)
  rescue ActionView::MissingTemplate
    false
  end


  def assemble_blocks

  end

end
