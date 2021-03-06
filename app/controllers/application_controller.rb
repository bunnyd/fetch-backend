class ApplicationController < ActionController::API
  # before_action :authorized
  def get_image_url
  # This method `get_image_url` returns a callback or LAMBDA that
  # takes in an image/attachment, tries to return the URL for the
  # image, and if it runs into an error, returns an empty string
  @cb = -> (image) do
    begin
      url_for(image)
    rescue Module::DelegationError
      ""
    end
  end
  @cb
end

def get_token
  @cb = -> (id) do
    begin
      encode_token({user_id: id})
    rescue Module::DelegationError
      ''
    end
  end
  @cb
end

  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end



  def current_owner
    if decoded_token
      owner_id = decoded_token[0]['user_id']
      @owner = Owner.find_by(id: owner_id)
  end
end

  def logged_in?
    !!current_owner
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end


end
