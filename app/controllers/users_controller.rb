class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@title = "sign up!"
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome, #{@user.name}.".html_safe
            session[:user_id] = @user.id
			redirect_to @user
		else
			flash.now[:failure] = "<span class='black'>Invalid</span> user data.".html_safe
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		logger.debug @user.inspect
		logger.debug "heee assaa"
		if @user.update_attributes(params[:user])
			flash[:success] = "Updated shit!"
			redirect_to @user
		else
			flash[:failure] = "Didn't update shit!"
			render :edit
		end
	end

	def destroy
	end

	def search
		@users = User.all
	end

end
