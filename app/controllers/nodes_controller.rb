class NodesController < ApplicationController

  before_filter :nodes_authorization, :except => [:show]
  before_filter :assemble_blocks
  helper :blocks

  prepend_view_path "app/pages"
  append_view_path "app/blocks"
  

  def index
    @nodes = NodeAbstract.all.collect(&:node)
    @node_type = ""
    render 'index' and return
  end


  def show
    path_parts = params[:path].dup

    loop do
      path = path_parts.join("/")

      if template = template_for_path(path)
        return render_static_path(template)
      elsif @node = node_for_path(path) and is_edit_request?
        return handle_edit_request
      elsif @node
        return render_node(@node)
      else
        render :template => "node_abstracts/missing_node", :status => 404
      end

      path_parts.pop
      break if path_parts.size < 1
    end
  end

private

  def is_edit_request?()
    return false if params[:path].empty? or params[:path].nil?
    params[:path].last == "edit"
  end


  def handle_edit_request()
    type = @node.class.name.underscore
    redirect_to send("edit_#{type}_path", @node)
  end


  def node_for_path(path)
    clean_path = path.gsub(/\/edit$/, '')
    clean_path = "/" if clean_path.blank?
    @abstract = NodeAbstract.find_by_path(clean_path)
    return nil if @abstract.nil?
    return @abstract.node
  end


  # This method should be moved into a Mixin that's included into ActionController::Base
  # and ActionView::Base (copy the methods used by render() in both cases).
  #
  def render_node(node)
    instance_variable_set("@#{node.class.name.singularize.underscore}", node)
    render :template => "#{node.class.name.tableize}/show"
  rescue ActionView::MissingTemplate
    render :template => "nodes/show"
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
