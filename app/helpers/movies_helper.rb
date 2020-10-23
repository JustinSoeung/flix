module MoviesHelper
    def concise (movie)
        truncate(movie.description, length: 40, separator: ' ')
    end

    def total_gross(movie)
        if movie.flop?
           "Flop!"
        else
            number_to_currency(movie.total_gross, precision:0)
        end
    end
    
    def year_of(movie)
        movie.released_on.strftime("%Y")
    end
end
