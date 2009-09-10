ActionController::Routing::Routes.draw do |map|
  map.resource :card
  
  map.resources :withdrawals
  
  map.login "/login",:controller=>"cards",:action=>"login",:conditions => { :method => :post }
  map.cap "/cap/:id",:controller=>"cards",:action=>"cap",:conditions => { :method => :get }
  map.oauth "/oauth",:controller=>"oauth",:action=>"show",:conditions => { :method => :get }
  map.oauth_callback "/oauth_callback",:controller=>"oauth",:action=>"callback",:conditions => { :method => :get }
  
  map.root :controller=>"cards",:action=>"new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
