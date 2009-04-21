ActionController::Routing::Routes.draw do |map|

  map.seo '*path', :controller => 'nodes', :action => 'show'

end
