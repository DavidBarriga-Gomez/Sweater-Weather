class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user &. authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
      # finds user, authenticats, then converts user to json else returns error 
    else
      render json: bad_credentials, status: 400
    end
  end

  def bad_credentials
    {errors:
    [{
      "status": 400,
      "detail": "Bad Credentials"
    }]}
  end
end
