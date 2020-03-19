class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @listings = Listing.all
  end

  def show;end

  def edit;end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, notice: 'Listing was successfully destroyed.'
  end  

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:company).permit!
    end
end
