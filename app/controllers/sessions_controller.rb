class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:name])
  	if user.nil? 
  		flash.now[:failure] = "Invalid email / password combination."
  		render 'new'
  	else
  		session[:user_id] = user.id
  		flash[:success] = "Logged in successfully as #{user.name}"
  		redirect_to root_path
  		#redirect_back_or user
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Signed out successfully"
  	redirect_to root_path
  end
end