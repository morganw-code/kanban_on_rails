class ListingsController < ApplicationController
    before_action :authenticate_user!

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

    private

    def listing_params
        return params.require(:listing).permit(:title, :message)
    end
end