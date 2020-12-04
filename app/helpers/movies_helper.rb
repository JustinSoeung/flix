module MoviesHelper
    def concise (movie)
        truncate(movie.description, length: 40, separator: ' ')
    end

    def total_gross(movie)
        if movie.flop?
           "Flop!"
        else
            number_to_currency(number_to_human(movie.total_gross))
        end
    end
    
    def year_of(movie)
        movie.released_on.year
    end
end
