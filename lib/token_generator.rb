class TokenGenerator

  def self.generate
    loop do
      token = SecureRandom.urlsafe_base64(6)
      break token unless Redirect.exists?(short_url: token)
    end
  end

end
