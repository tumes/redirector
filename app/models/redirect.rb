class Redirect < ActiveRecord::Base

  validates :url, presence: true
  validates :url_token, uniqueness: true

  before_create :assign_url_token

  def self.find_by_url_token(url_token)
    self.where(url_token: url_token).last || NullRedirect.new
  end

  private

  def assign_url_token
    self.url_token = TokenGenerator.generate
  end

end
