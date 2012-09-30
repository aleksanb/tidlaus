class RolesController < ApplicationController
	before_filter :find_by_id, :only => [:show, :edit, :update]
	#filter_access_to :all

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
	end

	def destroy
		@role = Role.find(params[:id])
		@role.destroy
		flash[:success] = "Role Destroyed."
		redirect_to roles_path
	end

	protected

	def find_by_id
		@role = Role.find(params[:id])

		if @role.nil?
			raise ActiveRecord::RecordNotFound
		end

	end
end