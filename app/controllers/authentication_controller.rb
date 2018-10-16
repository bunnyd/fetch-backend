class AuthenticationController < ApplicationController
	# skip_before_action :authorized, only: [:create]

  def create
    @owner = Owner.find_by(email: owner_login_params[:email])
    #User#authenticate comes from BCrypt
    if @owner && @owner.authenticate(owner_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ owner_id: @owner.id })
      render json: { owner: OwnerSerializer.new(@owner), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def a
    token = decoded_token
    render json: { owner: current_owner}
  end

  private

  def owner_login_params
    params.require(:owner).permit(:email, :password)
  end
end
