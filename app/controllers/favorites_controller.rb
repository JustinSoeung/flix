class FavoritesController < ApplicationController
    before_action :require_signin

    def create
        @movie = Movie.find(params[:movie_id]) #so this will get the movie id since the route needs it
        @movie.favorites.create!(user: current_user) #This creates the favorite in the favorite model with the current user's id
        
        redirect_to @movie
    end
    
end
