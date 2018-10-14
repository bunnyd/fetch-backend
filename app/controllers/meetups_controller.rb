class MeetupsController < ApplicationController
  def index
    render json: Meetup.includes(:owners), include: ['owners']
  end

  def show
  end

  def edit
  end

  def new
  end
end
