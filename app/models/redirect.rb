class Redirect < ActiveRecord::Base

  validates :url, presence: true
  validates :short_url, uniqueness: true

  before_create :assign_short_url

  private

  def assign_short_url
    self.short_url = TokenGenerator.generate
  end

end
