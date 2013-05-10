Tidlaus::Application.routes.draw do

  resources :links
  resources :pages
  resources :sessions
  resources :images
  resources :articles

  post "/articles/:id/hsf", :to => "articles#hsf", :as => "hsf"

  resources :roles, :only => [:index, :show, :new, :create, :edit, :update, :destroy]

  post "/roles/:id/authorize/" => "roles#authorize", :as => "authorize"
  delete "/roles/:id/deauthorize/" => "roles#deauthorize", :as => "deauthorize"
  get "users/search.:format" => "users#search", :as => :users_search
  resources :users

  get "/" => "pages#index", :as => "root" 
  
  get "/login" => "sessions#new", :as => "login"
  post "/logout" => "sessions#destroy", :as => "logout"

  get "/kaizervirus" => "pages#kaizervirus"
  get "/demos" => "pages#demos"
  get "/chat" => "pages#chat"
  get "/python/" => "pages#python"
  get "/ajax/" => "pages#ajax"

  get '/:id' => "links#redirect", :id => /[a-z0-9]{16,}/

end
