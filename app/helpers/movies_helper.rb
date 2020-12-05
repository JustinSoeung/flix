module MoviesHelper
    def concise (movie)
        truncate(movie.description, length: 40, separator: ' ')
    end

    def nav_link_to(text, url)
        if current_page?(url)
            link_to(text, url, class: "active")
        else
            link_to(text, url)
        end
        
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
