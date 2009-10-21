ActionController::Routing::Routes.draw do |map|

  map.resources :node_images
  map.resources :node_attachments
  map.resources :node_comments
  map.resources :node_abstracts

    # We require that the :id parameter for this resource
    # begin with an integer. This allows the SEO route (see bottom)
    # to intercept routes like /nodes/some_node_title
    # :requirements => { :id => /\d.*/ }
  
  map.seo '*path', :controller => 'node_abstracts', :action => 'show'

end
