class AttendingsController < ApplicationController
  filter_access_to [:destroy, :create]

  def create
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    @attending = Attending.new(
      user: current_user, 
      timechallenge: @timechallenge
      )
    if @attending.save
      flash[:success] = "You are now attending this timechallenge."
    else
      flash[:failure] = @attending.errors.full_messages.first
    end
    redirect_to @timechallenge
  end

  def destroy
    @timechallenge = Timechallenge.find(params[:timechallenge_id])
    @attending = Attending.where(user_id: params[:id]).where(timechallenge: @timechallenge).first
    if current_user != @attending.user 
      flash[:failure] = "Do not delete the participations of others."
    elsif @attending.destroy
      flash[:success] = "You are no longer attending this timechallenge."
    else
      flash[:failure] = @attending.errors.full_messages.first
    end
    redirect_to @timechallenge
  end
  
end
