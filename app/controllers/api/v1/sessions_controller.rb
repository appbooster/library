class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authorize_request!

  def create
    result = User::AuthWithGoogleOauth.new.call(request.env["omniauth.auth"])

    if result.success?
      token = JsonWebToken.encode(google_uid: result.value.google_uid)
      render json: { access_token: token,
                     token_type: "Bearer",
                     expires_in: 7.days }
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end
end
