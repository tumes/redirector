class RedirectsController < ApplicationController
  respond_to :html

  def new
    @redirect = Redirect.new
  end

  def create
    @redirect = Redirect.where(redirect_attributes).first_or_create
    respond_with @redirect
  end

  def show
    @redirect = Redirect.find(params[:id])
  end

  private

  def redirect_attributes
    params.require(:redirect).permit(:url)
  end

end
