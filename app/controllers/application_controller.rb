class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_current_user_for_model_layer_access_control
	helper :all

	def current_user
		begin
			if logged_in?
				@current_user = User.find(session[:user_id])
			end
		rescue
			@current_user = nil
		end
	end

	def logged_in?
		!session[:user_id].nil?
	end

	def permission_denied 
		flash[:failure] = "This action is protected."
		#redirect_to :back
	#rescue ActionController::RedirectBackError
		redirect_to login_path
	end

	protected

		def set_current_user_for_model_layer_access_control
			Authorization.current_user = current_user
		end

end
