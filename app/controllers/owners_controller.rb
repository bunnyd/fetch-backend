class OwnersController < ApplicationController
  before_action :owner_params, only: [:create]

  def index
    render json: Owner.all
  end

  def show
    owner = Owner.where("id=?",params[:id])
    render json: owner
  end

  def new
  end

  def edit
  end

  def create
    # debugger

    owner = Owner.new(owner_params)

    if owner.valid?
      owner.save
      session[:owner_id] = owner.id
      render json: owner
    else
      render json: {errors: owner.errors}
    end
  end

  def update

    owner = Owner.find(params[:id])
    meetup = Meetup.find(params[:meetup_ids][0][:id])
    owner.meetups.push(meetup)
    owner.save
    render json: owner
  end


  def searchDogParks

    yelpBaseURL = "https://api.yelp.com/v3/businesses/search?"
    yelpAPIKey = "DbV0IdA1MLH2cP5hYyf2I842erL0NFPkP8IT__tcVoEmyhXSgm8XKfU6bVQuYCqlEWUuoOGVi81SDqURqzOGGglcONPgZ_bNdplF1ZxPJ2AmvzYEbdz1Okmk3Im7W3Yx"
    yelpURL = "#{yelpBaseURL}term=dog_park&location=#{params[:zip_code]}"

    response = RestClient.get(yelpURL, {'Authorization' => "Bearer #{yelpAPIKey}"  })

    result = JSON.parse(response.body)
    # puts "AHHHH HIT"
    # byebug

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
# dogs_attributes:[[ :name, :age, :breed, :size, :sex, :short_bio, :picture_url]],
  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :password, :title, :picture_url, :zip_code,
    meetup_ids: [] )
  end
end
