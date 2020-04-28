class ListingsController < ApplicationController
    before_action :authenticate_user!
    # call set_user_listing only when edit, update, or destroy action has been called
    before_action :set_user_listing, only: [:edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def create
        @listing = current_user.listings.create(listing_params)

        if @listing.errors.any?
            render plain: "errors"
        else
            redirect_to listings_path
        end
    end

    def new
        @listing = Listing.new
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def show
    end

    def update
        @listing = Listing.update(params[:id], listing_params)
        if @listing.errors.any?
            render plain: "errors"
        else 
            redirect_to listings_path
        end
    end

    def destroy
        Listing.find(params[:id]).destroy
        redirect_to listings_path
    end

    private

    def listing_params
        return params.require(:listing).permit(:title, :message)
    end

    def set_user_listing
        @listing = current_user.listings.find_by_id(params[:id])

        # if listing doesn't exist redirect user to listings_path
        if @listing == nil
            redirect_to listings_path
        end
    end
end