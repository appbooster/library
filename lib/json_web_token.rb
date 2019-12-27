class JsonWebToken
  class << self
    def encode(payload, lifetime = 7.days)
      payload[:exp] = (Time.current + lifetime).to_i
      JWT.encode(payload, ENV["SECRET_KEY_BASE"])
    end

    def decode(token)
      body = JWT.decode(token, ENV["SECRET_KEY_BASE"])[0]
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError
      nil
    end
  end
end
