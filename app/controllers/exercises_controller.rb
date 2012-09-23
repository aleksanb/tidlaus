class ExercisesController < ApplicationController

	def create
		@exercise = current_user.exercises.build(params[:exercise])
		if @exercise.save
			redirect_to current_user, flash.now[:success] => "Fag lagt til!"
		else
			redirect_to current_user, flash.now[:failure] => "Ugyldig navn!"
		end
	end

	def destroy
		@exercise.destroy
		redirect_to root_path, flash.now[:success] => "Oving slettet"
	end


end
