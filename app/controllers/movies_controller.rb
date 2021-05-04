class MoviesController < ApplicationController
  def index
    #@list_of_directors=Director.all
    @list_of_movies=Movie.all
    
    
    render({ :template=> "movie_template/index.html.erb"})
  end
end