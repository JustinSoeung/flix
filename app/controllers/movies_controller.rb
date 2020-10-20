class MoviesController < ApplicationController
    def index
        @movies = ["Ironman", "Avengers", "Interstellar", "Good Will Hunting"]
    end
end
