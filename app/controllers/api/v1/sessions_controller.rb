class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authorize_request!

  def create_with_google
    user_params = auth_hash_to_attributes(request.env["omniauth.auth"])
    result = User::AuthWithGoogleOauth.new.call(user_params)

    if result.success?
      render json: { access_token: result.value, token_type: "Bearer", expires_in: 7.days }
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def create
    user_params = params.require(:user).permit(%i[email google_uid first_name last_name])
    result = User::AuthWithGoogleOauth.new.call(user_params)

    if result.success?
      render json: { access_token: result.value, token_type: "Bearer", expires_in: 7.days }
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def auth_hash_to_attributes(auth)
    {
      email: auth.info[:email],
      google_uid: auth.uid.to_s,
      first_name: auth.info[:first_name],
      last_name: auth.info[:last_name]
    }
  end
end
