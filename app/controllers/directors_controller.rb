class DirectorsController < ApplicationController
  def index
    render({ :template=> "director_template/index.html.erb"})
  end
end