module ExercisesHelper
	def current_user
		if !User.find(session[:current_user]).nil?
			User.find(session[:current_user])
		else
			User.find_by_name("aleksanb")
		end
	end

end
