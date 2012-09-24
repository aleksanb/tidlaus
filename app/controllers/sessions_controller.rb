class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:name],params[:session][:password])
  	if user.nil? 
  		flash.now[:failure] = "Invalid username / password combination."
  		render 'new'
  	else
  		session[:user_id] = user.id
  		flash[:success] = "Logged in successfully as #{user.name}."
  		redirect_to root_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Signed out successfully."
  	redirect_to root_path
  end
end
