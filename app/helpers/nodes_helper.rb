module NodesHelper

  def nodes_head
    javascript_include_tag('tiny_mce/tiny_mce.js') +
    javascript_include_tag('nodes.js') +
    stylesheet_link_tag('nodes/nodes.css')
  end

end

