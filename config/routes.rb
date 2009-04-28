ActionController::Routing::Routes.draw do |map|

  map.resources :nodes
    # We require that the :id parameter for this resource
    # begin with an integer. This allows the SEO route (see bottom)
    # to intercept routes like /nodes/some_node_title
    # :requirements => { :id => /\d.*/ }
  
  map.seo '*path', :controller => 'nodes', :action => 'show'

end
