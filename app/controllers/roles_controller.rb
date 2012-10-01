class RolesController < ApplicationController
	filter_access_to :all, :attribute_check => true

	def index
		@roles = Role.all
	end

	def new
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
	end

	def destroy
		@role.destroy
		flash[:success] = "Role Destroyed."
		redirect_to roles_path
	end

end