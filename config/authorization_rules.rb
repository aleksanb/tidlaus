authorization do

  role :guest do
    #read permissions
    has_permission_on :links, :to => :read
    has_permission_on :users, :to => :read
    has_permission_on :pages, :to => :read_static_pages
    has_permission_on :articles, :to => :read
    has_permission_on :images, :to => :read
    has_permission_on :sessions, :to => :manage
    has_permission_on :links, :to => :redirect

    #creation permissions
    has_permission_on :links, :to => :create
    has_permission_on :users, :to => :create
  end

  role :user do
    includes :guest

    has_permission_on :users, :to => :update do
      if_attribute :id => is {user.id}
    end

  end

  role :contributor do
      includes :guest
      includes :user

      has_permission_on :images, :to => :create
      has_permission_on :articles, :to => :create

  end

  role :admin do
    includes :user

    has_permission_on [
      :links,
      :users, 
      :images,
      :articles,
      :sessions,
      :roles, 
      :users_roles,
      :authorization_rules, 
      :authorization_usages ], :to => :manage
    has_permission_on :pages, :to => :read_static_pages
    has_permission_on :links, :to => :redirect
    has_permission_on :articles, :to => :hsf
  end

end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete, :search, :authorize, :deauthorize, :create_omniauth]
  privilege :read,   :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy

  # allow redirecting
  privilege :redirect, :includes => [:redirect]

  #static pages
  privilege :read_static_pages, :includes => [:index,:about, :magi, :chat, :kaizervirus]
end
