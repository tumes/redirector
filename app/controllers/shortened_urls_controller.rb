class ShortenedUrlsController < ApplicationController

  def show
    @redirect = Redirect.find_by_url_token(params[:id])
    redirect_to @redirect.url_with_protocol, status: 301
  end

end
