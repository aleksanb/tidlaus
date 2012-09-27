Tidlaus::Application.routes.draw do



  match '/py/', :to => "links#pycreate"

  resources :links
  resources :users
  resources :pages
  resources :sessions
  resources :images

  root :to => "pages#index" #"users#new" #"users#new"
  
  match "/login", :to => "sessions#new", :as => "login"
  match "/logout", :to => "sessions#destroy", :as => "logout"

  match "/kaizervirus", :to => "pages#kaizervirus"
  match "/about", :to => "pages#about"
  match "/magi", :to => "pages#magi"
  match "/chat", :to => "pages#chat"
  match "/python/", :to => "pages#python"
  match "/ajax/", :to => "pages#ajax"

  match '/:id', :to => "links#redirect", :id => /[a-z0-9]{64,}/
  #match '/:id', :to => "users#show"
  #redirect("/links/%{id}")#, :constraints => { :id => "/\A[a-z0-9]{64}\z/i" }
  #match '/:id' => redirect("/users/%{id}") #'users#show'

  #match '/:name', :controller => 'users', :action => 'show'

  #match '/:id' => 'users#show' #implementer proper /:name => 'users#show'



  #map.connect '/:name', :controller => 'users', :action => 'show'

 # about :to => "pages#about"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:e
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
