class AuthenticationController < ApplicationController
	# skip_before_action :authorized, only: [:create]

  def create
    # debugger
    @owner = Owner.find_by(email: owner_login_params[:email])
    #User#authenticate comes from BCrypt
    if @owner && @owner.authenticate(owner_login_params[:password])
      # debugger
      # encode token comes from ApplicationController
      @token = get_token
      @image = get_image_url
      # debugger
      render json: @owner, get_token: @token, get_image_url: @image, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def a
    @token = get_token
    @owner = current_owner
    @image = get_image_url
    render json: @owner, get_token: @token, get_image_url: @image
  end

  private

  def owner_login_params
    params.require(:owner).permit(:email, :password)
  end
end
