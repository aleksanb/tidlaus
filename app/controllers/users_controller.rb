class UsersController < ApplicationController

	def index
	end

	def show
		#@user = User.find_by_name(params[:name])
		@user = User.find_by_name(params[:id])
		@exercises = @user.exercises
	end

	def new
		@user = User.new
		@title = "sign up!"
	end

	def create
		@user = User.new(params[:user])
		@mightexist = User.find_by_name((params[:user][:name]).downcase)
		if @mightexist
			redirect_to @mightexist, flash.now[:success] => "Velkommen tilbake!"
		else
			if @user.save
				redirect_to @user, flash.now[:success] => "Velkommen til systemet, #{@user.name}"
			else
				@title = "Prov paa nytt!"
				render 'new', flash.now[:failure] => "Ugyldig navn!"
			end
		end

	end

	def edit
	end

	def update
	end

	def destroy
	end

end
