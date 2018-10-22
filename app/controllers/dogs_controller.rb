class DogsController < ApplicationController
  # before_action :dog_params, only: :create

  def index
    @dogs = Dog.all
    @image = get_image_url

    render json: @dogs, get_image_url: @image

  end

  def show
  end

  def new
  end

  def create
    @dog = Dog.new(dog_params)
    # debugger
    if @dog.valid?
      @dog.save
      @image = get_image_url
      render json: @dog
    else
      render json: {errors: @dog.errors}
    end
  end

  def edit
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :size, :sex, :short_bio, :owner_id, :image)
  end
end
