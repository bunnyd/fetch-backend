class OwnersController < ApplicationController
  # before_action :owner_params, only: [:create]
  # skip_before_action :authorized, only: [:create]


  def index
    @owners = Owner.all
    @image = get_image_url

    render json: @owners, get_image_url: @image
  end

  def show
    @owner = Owner.where("id=?",params[:id])
    @image = get_image_url

    render json: @owner, get_image_url: @image
  end

  def create
    @owner = Owner.new(owner_params)
    # debugger
    if @owner.valid?
      @owner.save
      @token = get_token
      @image = get_image_url
      render json: @owner, get_token: @token, get_image_url: @image
    else
      render json: {errors: @owner.errors}
    end
  end

  def update

    @owner = Owner.find(params[:id])
    meetup = Meetup.find(params[:meetup_ids][0][:id])
    @owner.meetups.push(meetup)
    @owner.save
    render json: @owner
  end


  def searchDogParks
# debugger
    yelpBaseURL = "https://api.yelp.com/v3/businesses/search?"
    yelpAPIKey = "DbV0IdA1MLH2cP5hYyf2I842erL0NFPkP8IT__tcVoEmyhXSgm8XKfU6bVQuYCqlEWUuoOGVi81SDqURqzOGGglcONPgZ_bNdplF1ZxPJ2AmvzYEbdz1Okmk3Im7W3Yx"
    yelpURL = "#{yelpBaseURL}term=dog_park&location=#{params[:zip_code]}"

    response = RestClient.get(yelpURL, {'Authorization' => "Bearer #{yelpAPIKey}"  })

    result = JSON.parse(response.body)
    # puts "AHHHH HIT"

    render json: result
  end

  def searchDogRestaurants
    yelpBaseURL = "https://api.yelp.com/v3/businesses/search?"
    yelpAPIKey = "DbV0IdA1MLH2cP5hYyf2I842erL0NFPkP8IT__tcVoEmyhXSgm8XKfU6bVQuYCqlEWUuoOGVi81SDqURqzOGGglcONPgZ_bNdplF1ZxPJ2AmvzYEbdz1Okmk3Im7W3Yx"
    yelpURL = "#{yelpBaseURL}term=dog_friendly_restaurants&location=#{params[:zip_code]}"
    response = RestClient.get(yelpURL, {'Authorization' => "Bearer #{yelpAPIKey}"  })

    result = JSON.parse(response.body)

    render json: result
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :password, :title, :zip_code, :image,
    meetup_ids: [])
  end
end
