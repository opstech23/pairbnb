class ListingsController < ApplicationController
  before_action :require_login

  def index
    current_user.listings
  end

  def new
  	@listings = Listing.new
  end
end
