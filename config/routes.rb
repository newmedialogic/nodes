ActionController::Routing::Routes.draw do |map|

  map.resources :nodes,
    :requirements => { :id => /\d.*/ }

  map.seo '*path', :controller => 'nodes', :action => 'show'

end
