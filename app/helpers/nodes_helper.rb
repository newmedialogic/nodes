module NodesHelper

  def nodes_head
    javascript_tag do
      "var Nodes = { User: #{@node_user.to_json} };";
    end +
    javascript_include_tag('tiny_mce/tiny_mce.js') +
    javascript_include_tag('nodes/nodes.js') +
    stylesheet_link_tag('nodes/nodes.css')
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

