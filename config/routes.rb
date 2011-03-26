Twitterific::Application.routes.draw do

  get '/login', :to => "welcome#login", :as => "login"
  post '/login', :to => "welcome#login_do", :as => "login_do"
  
  get '/logout', :to => "welcome#logout", :as => "logout"
  
  resource :users

  get '/register', :to => "users#new", :as => "register"
  
  get '/follow/:user', :to => "welcome#follow", :as => "follow"

  post '/tweet', :to => "welcome#tweet", :as => "tweet"
  
  get '/users', :to => "welcome#users", :as => "users"

  get '/:user', :to => "welcome#user", :as => "user"
  
    
  root :to => "welcome#index"
  
end
