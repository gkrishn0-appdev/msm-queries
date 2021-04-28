class DirectorsController < ApplicationController
  def index
    @list_of_directors=Director.all
    
    render({ :template=> "director_template/index.html.erb"})
  end
  def wisest
    @list_of_directors=Director.all
    @oldest=Director.where.not({ :dob=> nil}).order({ :dob => :asc }).at(0).name
    @dob = Director.where.not({ :dob=> nil}).order({ :dob => :asc }).at(0).dob
    render({ :template=> "director_template/eldest.html.erb"})
  end

  def youth
    @list_of_directors=Director.all
    @youngest=Director.where.not({ :dob=> nil}).order({ :dob => :desc }).at(0).name
    @dob = Director.where.not({ :dob=> nil}).order({ :dob => :desc }).at(0).dob
    #@oldest=Director.where.not({ :dob=> nil}).order({ :dob => :asc }).at(0).name
    #@dob = Director.where.not({ :dob=> nil}).order({ :dob => :asc }).at(0).dob
    @youngest= Director.order({ :dob => :desc }).at(0)
    render({ :template=> "director_template/youth2.html.erb"})
  end

  def director_details
    params.fetch("an_id")
    @the_id = params.fetch("an_id")
    @the_director = Director.where({ :id => @the_id }).at(0)
    render({ :template=> "director_template/show.html.erb"})
  end
end