module NodesHelper

  def nodes_user
    if respond_to?(:current_user, true)
      controller.send(:current_user) || Nodes::AnonymousUser.new
    elsif respond_to?(:active_user, true)
      controller.send(:active_user) || Nodes::AnonymousUser.new
    else
      raise Nodes::ConfigurationError.new("Please implement current_user or active_user in your controller, and make it return an object that represents a user.")
    end
  end


  def nodes_head
    javascript_tag do
      "var Nodes = { User: { Profile: '#{nodes_user.nodes_wysiwyg_profile}'} };";
    end +
    javascript_include_tag('tiny_mce/tiny_mce.js') +
    javascript_include_tag('nodes/nodes.js') +
    stylesheet_link_tag('nodes/nodes.css')
  rescue NameError => err 
    raise Nodes::ConfigurationError, "Perhaps you forgot to include Nodes::Controller in ApplicationController? or Nodes::User in your User class? #{err.class.name} occurred: #{err.message}"
  end


  def nodes_popup_head
    javascript_include_tag('jquery.js') +
    javascript_include_tag('tiny_mce/tiny_mce.js') +
    javascript_include_tag('tiny_mce/tiny_mce_popup.js') +
    javascript_include_tag('nodes/nodes_popup.js') +
    stylesheet_link_tag('nodes/nodes_popup.css')
  end


  def render_node(node)
    render :partial => "#{node.class.name.tableize}/teaser", :locals => { :node => node }
  rescue ActionView::MissingTemplate => e
    render :text => e and return
    render :partial => 'nodes/teaser', :locals => { :node => node }
  end


end

