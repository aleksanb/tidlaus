class ParticipationsController < ApplicationController

  def create
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    @attendance = Attending.new(
      user: current_user, 
      timechallenge: @timechallenge
      )
    if @attendance.save
      flash[:success] = "You are now attending this timechallenge."
    else
      flash[:failure] = @attendance.errors.full_messages.first
    end
    redirect_to @timechallenge
  end

  def destroy
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    @attendance = Attending.where(user_id: params[:id]).where(timechallenge: @timechallenge).first

    if @attendance.destroy
      flash[:success] = "You are no longer attending this timechallenge."
    else
      flash.now[:failure] = @attendance.errors
    end
    redirect_to @timechallenge
  end
  
end
