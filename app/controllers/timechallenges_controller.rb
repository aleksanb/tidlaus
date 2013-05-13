class TimechallengesController < ApplicationController

  def index
    @timechallenges = Timechallenge.all
  end

  def new
    @timechallenge = Timechallenge.new
  end

  def create
    @timechallenge = Timechallenge.new(timechallenge_params)
    if @timechallenge.save
      flash[:success] = "Created timechallenge"
      redirect_to @timechallenge
    else
      flash.now[:failure] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @timechallenge = Timechallenge.find(params[:id])
  end

  private

    def timechallenge_params
      params.require(:timechallenge).permit(:title)
    end

end
