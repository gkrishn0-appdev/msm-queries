class ActorsController < ApplicationController
  def index
    #@list_of_directors=Director.all
    @list_of_actors=Actor.all
    
    render({ :template=> "actor_template/index.html.erb"})
  end

  def movie_details
    params.fetch("an_id")
    @the_id = params.fetch("an_id")
    @the_director = Actor.where({ :id => @the_id }).at(0)
    @filmography = Character.where({:actor_id => @the_director.id})
    render({ :template=> "actor_template/show.html.erb"})
  end

end