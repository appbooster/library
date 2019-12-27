class JsonWebToken
  class << self
    def encode(payload, lifetime = 7.days)
      payload[:exp] = (Time.current + lifetime).to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError
      nil
    end
  end
end
