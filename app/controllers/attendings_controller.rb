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

  def update
    @attending = Attending.find(params[:id])
    status = params[:attending][:status]
    status = (status != "")? Status.find_by_id(params[:attending][:status]) : nil
    @attending.status = status

    respond_to do |format|
      format.json {
        logger.debug("bypassing model validations for updating of status")
        logger.debug("Processing JSON")
        @attending.save()
        render :json => @attending
      }
      format.all {
        logger.debug("bypassing model validations for updating of status")
        if @attending.save!()
          flash[:success] = "<span class='black'>Success!</span> You updated the attendance!".html_safe
          redirect_to @attending
        else
          flash.now[:failure] = "<span class='black'>Invalid</span> update fields.".html_safe
          render 'new'
        end
      }
    end
  end
  
end
