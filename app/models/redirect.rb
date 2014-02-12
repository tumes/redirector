class Redirect < ActiveRecord::Base

  validates :url, presence: true
  validates :url_token, uniqueness: true

  before_create :assign_url_token

  # Public: Mimics the now-deprecated find_by_x functionality of Rails, but returns
  # a null Redirect if the redirect does not exist.

  def self.find_by_url_token(url_token)
    self.where(url_token: url_token).last || NullRedirect.new
  end

  def url_with_protocol
    url.match(/\Ahttps?:\/\//) ? url : "http://#{url}"
  end

  private

  def assign_url_token
    self.url_token = TokenGenerator.generate
  end

end
