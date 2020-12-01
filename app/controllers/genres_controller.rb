class GenresController < ApplicationController
    def show
        @genre = Genre.find(params[:id])
        @movie = @genre.movies
        
    end
    
end
