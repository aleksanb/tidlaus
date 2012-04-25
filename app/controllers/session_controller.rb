class SessionController < ApplicationController

	def new
		session[:login] = 1
		redirect_to magi_path#, flash[:notice] = "Logged in!"
	end

	def destroy 
		session[:login] = nil
		redirect_to root_path# flash[:notice] = "Logged out!"
	end

end
