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
    
    def main_image(movie)
        if movie.main_image.attached?
            image_tag movie.main_image.variant(resize_to_limit: [150,150])
        else
            image_tag "placeholder.png"
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
