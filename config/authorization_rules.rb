authorization do

	role :admin do
		has_permission_on :roles, :to => :manage
		has_permission_on :authorization_rules, :to => :read
    	has_permission_on :authorization_usages, :to => :read
	end

end