class UsersController < ApplicationController

	def index
		@users = User.all
		@title = "All users"
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		@title = "Sign up"
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to @user#, flash[:notice] = "Ovingssystembruker get!" #:flash => {success => "Ovingssystemhusk get!"}
		else
			@title = "Sign up"
			render 'new'
		end
	end

	#def edit
	#end

	#def update
	#end

	#def destroy
	#end

end
