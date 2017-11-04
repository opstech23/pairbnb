class ListingsController < ApplicationController
  before_action :require_login , only: [:destroy]

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

  def update
  	@listing = Listing.find(params[:id])
  	if @listing.update listing_params
  		@listing.save
  		redirect_to listing_path
  	else
  		render 'edit'
  	end
  end

  def show
  	@listing = Listing.find(params[:id])
  end

  def destroy
  	@listing = Listing.find(params[:id])
  	if @listing.destroy
  		redirect_to listing_path
  	end
  end

  private
  	def listing_params
  		params.require(:listing).permit(:title, :description, :country,
  			:state_or_province, :max_guests, :price)
  	end
end
