class MeetupsController < ApplicationController
  before_action :meetup_params, only: :create

  def index
    render json: Meetup.all
  end

  def show

  end

  def edit
  end

  def create
    meetup = Meetup.new(meetup_params)
    if meetup.valid?
      meetup.save
      render json: meetup
    else
      render json: meetup.errors
    end
  end

  private
  def meetup_params
    params.require(:meetup).permit(:name, :address, :date, :time, :zip_code)
  end
end
