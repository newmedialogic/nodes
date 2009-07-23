module NodeCommentsHelper

  def comments_and_form_for(node, options = {})
    capture do
      comments_for(node, options)
      if allow_posting_node_comments
        comment_form_for(node, options)
      end
    end
  end


  def comments_for(node, options = {})
    render :partial => "/node_comments/comments_for", :locals => { :node => node }
  end


  def comment_form_for(node, options = {})
    render :partial => "/node_comments/inline_comment_form", :locals => { :node => node }
  end

end
