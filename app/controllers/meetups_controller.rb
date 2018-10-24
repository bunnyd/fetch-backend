class MeetupsController < ApplicationController
  # before_action :meetup_params, only: :create

  def index
    @image = get_image_url
    @owners = []
    Meetup.all.each do |meetup|
      meetup.owners.each do |owner|
        @owner = owner
        @dogs = owner.dogs
        @owners << OwnerSerializer.new(@owner, get_image_url: @image, dogs: @dogs)
      end
    end

    @meetups = Meetup.all


    render json: @meetups, owners: @owners, dogs: @dogs, get_image_url: @image
  end

  def show
    @image = get_image_url
    @meetup = Meetup.find(params[:id])
    @meetup.owners.each do |owner|
      @dogs = owner.dogs
      @owners = []
      @owners << OwnerSerializer.new(owner, get_image_url: @image, dogs: @dogs)
    end

    render json: @meetup, owners: @owners, dogs: @dogs, get_image_url: @image
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
    params.require(:meetup).permit(:location_name, :address, :picture_url, :date, :time, :zip_code, :url)
  end
end
