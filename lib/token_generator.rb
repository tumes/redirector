class TokenGenerator

  def self.generate
    loop do
      token = SecureRandom.urlsafe_base64(6)
      break token unless Redirect.exists?(url_token: token)
    end
  end

end
