class ShortenedUrlsController < ApplicationController

  def show
    @redirect = Redirect.find_by_short_url(params[:id])
    redirect_to @redirect.url, status: 301
  end

end
