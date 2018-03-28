class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end 

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
      if @listing.save
        flash[:notice] = 'You have successfully listed your services!'
        redirect_to @listing
      else
        flash[:notice] = 'Something went wrong with listing your services!'
        redirect_to new_listing_path(@listing)
      end
  end   



  def show
    @listing.user
  end

  def edit
    current_user = @listing.user_id
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      redirect_to edit_listing_path
    end
  end

  def destroy
    @listing.destroy
    redirect_to "/listings"
  end

  def search
    @listings =  Listing.all
      filtering_params(params).each do |key,value|
        @listings = @listings.public_send(key, value) if value.present?
        if @listings.empty?
          flash[:notice] = "Sorry there are no results for your search"
        end
        respond_to do |format|
        format.js
        end
      end
  end

private

  def listing_params
    params.require(:listing).permit(:country, :location, :title, :description, :business_name, :contact, speciality:[] )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def filtering_params(params)
    params.slice(:country, :location, speciality: [] )
  end

end
