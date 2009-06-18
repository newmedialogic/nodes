module NodesHelper

  def nodes_head
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

end

