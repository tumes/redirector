class Redirect < ActiveRecord::Base

  validates :url, presence: true
  validates :short_url, uniqueness: true

end
