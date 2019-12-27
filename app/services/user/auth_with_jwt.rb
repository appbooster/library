class User::AuthWithJwt
  def call(headers)
    token = decoded_auth_token(headers)
    User.find_by(google_uid: token[:google_uid]) if token
  end

  private

  def decoded_auth_token(headers)
    return unless headers["Authorization"]

    auth_header = /Bearer\s(?<token>\S+)\z/.match(headers["Authorization"])
    return unless auth_header

    JsonWebToken.decode(auth_header[:token])
  end
end
