class UsersController < ApplicationController
	filter_access_to :all
	filter_access_to [:destroy, :edit, :update], :attribute_check => true

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
			UserMailer.password_reset(@user).deliver
			flash[:success] = "Updated shit!"
			redirect_to @user
		else
			flash[:failure] = "Didn't update shit!"
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "<span class='black'>Success!</span> You destroyed a user!".html_safe
		redirect_to users_path
	end

	def search
		@users = User.all
	end

end
