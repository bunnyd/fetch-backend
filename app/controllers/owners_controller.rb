class OwnersController < ApplicationController
  def index
    render json: Owner.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
