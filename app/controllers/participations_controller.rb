class ParticipationsController < ApplicationController

  def create
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    attendance = Attending.new(timechallenge: @timechallenge, user:  current_user)
    if attendance.save
      flash[:success] = "Sweet!"
      redirect_to @timechallenge
    else
      flash.now[:failure] = "failure!"
      render :new
    end
  end

  def destroy
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    attendance = Attending.find(timechallenge: @timechallenge, user: current_user)
    attendance.destroy
    redirect_to @timechallenge
  end
  
end
