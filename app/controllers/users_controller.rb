class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by_name(params[:id])
	end

	def new
		@title = "sign up!"
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome, #{@user.name}."
            session[:user_id] = @user.id
			redirect_to root_path
		else
			flash.now[:failure] = "Something went wrong."
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
