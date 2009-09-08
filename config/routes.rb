ActionController::Routing::Routes.draw do |map|
  map.resource :card
  map.login "/login",:controller=>"cards",:action=>"login",:conditions => { :method => :post }
  map.root :controller=>"cards",:action=>"new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
