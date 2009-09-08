ActionController::Routing::Routes.draw do |map|
  map.resource :card
  map.root :controller=>"cards",:action=>"new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
