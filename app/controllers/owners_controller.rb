class OwnersController < ApplicationController
  before_action :owner_params, only: [:create]

  def index
    render json: Owner.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    owner = Owner.new(owner_params)

    if owner.valid?
      owner.save
      session[:owner_id] = owner.id

      render json: {success: true}
    else
      render json: {errors: owner.errors}
    end
  end

  def update
    owner = Owner.find(params[:id])
    owner.update(owner_params)

    render json: owner
  end

  def searchDogParks
    yelpBaseURL = "https://api.yelp.com/v3/businesses/search?"
    yelpAPIKey = "DbV0IdA1MLH2cP5hYyf2I842erL0NFPkP8IT__tcVoEmyhXSgm8XKfU6bVQuYCqlEWUuoOGVi81SDqURqzOGGglcONPgZ_bNdplF1ZxPJ2AmvzYEbdz1Okmk3Im7W3Yx"
    yelpURL = "#{yelpBaseURL}term=dog_park&location=#{params[:zip_code]}"
    response = RestClient.get(yelpURL, {'Authorization' => "Bearer #{yelpAPIKey}"  })

    result = JSON.parse(response.body)

    render json: result
  end

  def searchDogRestaurants
    yelpBaseURL = "https://api.yelp.com/v3/businesses/search?"
    yelpAPIKey = "DbV0IdA1MLH2cP5hYyf2I842erL0NFPkP8IT__tcVoEmyhXSgm8XKfU6bVQuYCqlEWUuoOGVi81SDqURqzOGGglcONPgZ_bNdplF1ZxPJ2AmvzYEbdz1Okmk3Im7W3Yx"
    yelpURL = "#{yelpBaseURL}term=dog friendly restaurants&location=#{params[:zip_code]}"
    response = RestClient.get(yelpURL, {'Authorization' => "Bearer #{yelpAPIKey}"  })

    result = JSON.parse(response.body)

    render json: result
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :picture_url, :zip_code, dogs_attributes:[[ :name, :age, :breed, :size, :sex, :short_bio, :picture_url]])
  end
end