class User::AuthWithGoogleOauth
  def call(auth)
    user = User.find_by(google_uid: auth.uid.to_s)

    unless user
      user = User.new(email: auth.info[:email], google_uid: auth.uid, first_name: auth.info[:first_name],
                      last_name: auth.info[:last_name], remote_avatar_url: auth.info[:image])
    end

    return Result::Failure.new(user.errors) unless user.save

    Result::Success.new(user)
  end
end
