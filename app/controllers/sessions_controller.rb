class SessionsController < ApplicationController
  filter_access_to :all

  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(session_params)
  	if user.nil? 
  		flash.now[:failure] = "<span class='black'>Invalid</span> login details.".html_safe
  		render 'new'
  	else
  		session[:user_id] = user.id
  		flash[:login] = "Logged in as <span class='black'>#{user.name}.</span>".html_safe
  		redirect_to user
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Logged <span class='black'>out.</span>".html_safe
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:name, :password)
    end
end
