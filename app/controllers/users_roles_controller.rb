class UsersRolesController < ApplicationController
	#filter access here also
	before_filter :before_create, :only => :create
	filter_access_to :all

	def destroy
		@users_role = UsersRole.find(params[:id])
		@users_role.destroy
		flash[:success] = "User removed."
		redirect_to roles_path(@users_role.role)
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
		@users_role = UsersRole.new(
			:user_id => params[:user_id].to_i,
			:role_id => params[:role_id].to_i
		)
	end
end
