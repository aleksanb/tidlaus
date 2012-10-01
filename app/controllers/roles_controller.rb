class RolesController < ApplicationController
	filter_access_to :all

	def index
		@roles = Role.all
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(params[:role])
		if @role.save
			flash[:success] = "Success!"
			redirect_to @role
		else
			flash.now[:failure] = "Fail!"
			render :new
		end
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

end