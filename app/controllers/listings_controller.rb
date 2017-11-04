class ListingsController < ApplicationController
  before_action :require_login

  def index
    # current_user.listings
    @listings = Listing.all
  end

  def new
  	@listing = Listing.new
  end

  def create
  	@listing = Listing.new(listing_params)
  	if @listing.save
  		redirect_to listings_path
  	end
  end

  def edit
  	@listing = Listing.find(params[:id])
  end

  private
  	def listing_params
  		params.require(:listing).permit(:title, :description, :country,
  			:state_or_province, :max_guests, :price)
  	end
end
