class User::AuthWithGoogleOauth
  def call(auth)
    user = User.find_by(google_uid: auth[:google_uid])
    user = User.new(auth) unless user

    return Result::Failure.new(user.errors) unless user.save

    token = JsonWebToken.encode(google_uid: user.google_uid)
    Result::Success.new(token)
  end
end
