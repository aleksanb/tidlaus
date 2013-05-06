class UsersRolesController < ApplicationController
	filter_access_to :all
	before_filter :before_create, :only => :create

	def destroy
		@users_role = UsersRole.find(params[:id])
        unless @users_role.role_id == 1
            @users_role.destroy
            flash[:success] = "User removed."
            redirect_to roles_path(@users_role.role)
        else
            flash[:failure] = "No deleting admins!"
            redirect_to root_path
        end
	end

	def create
		if @users_role.role.users.include? @users_role.user
			flash[:failure] = "User already has this role."
			redirect_to @users_role.role
		elsif User.find_by_id(params[:user_id]).nil?
			flash[:failure] = "User doesn't exist in database."
			redirect_to @users_role.role
		else
			if @users_role.save!
				flash[:success] = "User added to role."
				redirect_to @users_role.role
			else
				flash.now[:failure] = "Errors were had"
				redirect_to @users_role.role
			end
		end
	end

	private
        def before_create
            unless params[:role_id].to_i == 1
                @users_role = UsersRole.new(
                    :user_id => params[:user_id].to_i,
                    :role_id => params[:role_id].to_i
                )
            else
                flash[:failure] = "No more admins!"
                redirect_to root_path
            end
        end
end
