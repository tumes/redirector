class TokenGenerator

  # Public: Generates a random, unique token for the Redirect model.

  # This method was cribbed from StackOverflow (http://stackoverflow.com/a/12109098/560632).

  # TODO: Tests.

  def self.generate
    loop do
      token = SecureRandom.urlsafe_base64(6)
      break token unless Redirect.exists?(url_token: token)
    end
  end

end
