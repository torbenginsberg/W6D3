require "byebug"
class ArtworksController < ApplicationController
    def index
        if params.has_key?(:user_id)
            @artworks = Artwork
                                .left_outer_joins(:shared_viewers)
                                .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", params[:user_id], params[:user_id])

            render json:@artworks
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end


    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url #might need to render destroyed artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end