authorization do

  role :guest do
    #read permissions
    has_permission_on :pages, :to => :read
    has_permission_on :users, :to => :read
    has_permission_on :images, :to => :read

    #creation permissions

  end

  role :admin do
    has_permissions_on [ 
      :users,
      :roles, 
      :users_roles,
      :images,
      :links,
      :pages
      :sessions,
      :authorization_rules, 
      :authorization_usages
      ], :to => :manage
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read,   :includes => [:index, :show, :search]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end