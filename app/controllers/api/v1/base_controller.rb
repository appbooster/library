class Api::V1::BaseController < ActionController::API
  before_action :authorize_request!

  private

  attr_reader :current_user

  def authorize_request!
    user = User::AuthWithJwt.new.call(request.headers)
    if user
      @current_user = user
    else
      render json: { errors: "Invalid identifier supplied" }, status: :unauthorized
    end
  end
end
