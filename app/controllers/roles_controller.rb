class RolesController < ApplicationController
	filter_access_to :all

	def index
		@roles = Role.all
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			flash[:success] = "Success!"
			redirect_to @role
		else
			flash.now[:failure] = "Fail!"
			render :new
		end
	end

	def authorize
		@role = Role.find_by_id(params[:id])
		user = User.find_by_id(params[:user_id])
		if @role != nil && user != nil
			user.roles << @role
		end
		redirect_to @role
	end

	def deauthorize
		@role = Role.find_by_id(params[:id])
		user = User.find_by_id(params[:user_id])
		if @role != nil && user != nil
			user.roles.delete @role
		end
		redirect_to @role
	end

	def show
		@role = Role.find(params[:id])
	end

	def destroy
		@role = Role.find(params[:id])
		@role.destroy
		flash[:success] = "Role Destroyed."
		redirect_to roles_path
	end

	private 
		def role_params
			params.require(:role).permit(:title)
		end

end
