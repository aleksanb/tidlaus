class TimechallengesController < ApplicationController
  filter_access_to :all

  def index
    @timechallenges = Timechallenge.all
  end

  def show
    @timechallenge = Timechallenge.find(params[:id])
  end

  def new
    @timechallenge = Timechallenge.new
  end

  def create
    @timechallenge = Timechallenge.new(timechallenge_params)
    if @timechallenge.save
      flash[:success] = "Created a new timechallenge."
      redirect_to @timechallenge
    else
      flash.now[:failure] = "Could not create a new timechallenge."
      render 'new'
    end
  end

  def destroy
    timechallenge = Timechallenge.find(params[:id])
    timechallenge.destroy
    flash[:success] = "Destroyed timechallenge. Attendants have been notified."
    redirect_to timechallenge
  end
  
  private

    def timechallenge_params
      params.require(:timechallenge).permit(:title, :reward, :deadline, :show_deadline)
    end

end
