class FavoritesController < ApplicationController
    before_action :require_signin
    before_action :set_movie

    def create
        # @movie = Movie.find(params[:movie_id]) #so this will get the movie id since the route needs it
        @movie.favorites.create!(user: current_user) #This creates the favorite in the favorite model with the current user's id
        
        redirect_to @movie
    end

    def destroy
        @favorite = current_user.favorites.find_by(params[:id])
        @favorite.destroy

        redirect_to @movie
    end
    

private
    def set_movie
        @movie = Movie.find(params[:movie_id])
        
    end
    
    
end
