Tidlaus::Application.routes.draw do



  match '/py/', :to => "links#pycreate"

  resources :links
  resources :pages
  resources :sessions
  resources :images
  resources :articles

  post "/articles/:id/hsf", :to => "articles#hsf", :as => "hsf"

  resources :roles, :only => [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :users_roles, :only => [:create, :destroy]
  end

  match "users/search.:format" => "users#search",
        :as => :users_search 
        
  resources :users

  root :to => "pages#index" #"users#new" #"users#new"
  
  match "/login", :to => "sessions#new", :as => "login"
  match "/logout", :to => "sessions#destroy", :as => "logout"

  match "/kaizervirus", :to => "pages#kaizervirus"
  match "/demos", :to => "pages#demos"
  match "/chat", :to => "pages#chat"
  match "/python/", :to => "pages#python"
  match "/ajax/", :to => "pages#ajax"

  match '/:id', :to => "links#redirect", :id => /[a-z0-9]{16,}/

end
