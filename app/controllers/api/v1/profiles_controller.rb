class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    render json: @current_user, serializer: Api::V1::UserSerializer, root: "profile"
  end
end
