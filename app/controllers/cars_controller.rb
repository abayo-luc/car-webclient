class CarsController < ApplicationController
  def index
    @cars = Unirest.get("http://localhost:3000/api/v2/cars.json").body
  end
  def show
    @car = Unirest.get("http://localhost:3000/api/v2/cars/#{params[:id]}.json").body
  end
  def new
    
  end

  def create
    @car = Unirest.post("http://localhost:3000/api/v2/new.json",
      :headers => {"accept" => "application/json"},
      :parameters => {:manufacturer => params[:manufacturer], :identification_number => params[:identification_number]}).body
    redirect_to "/cars/#{@car['id']}"
  end
end
