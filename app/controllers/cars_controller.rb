class CarsController < ApplicationController
  def index
    # cars_arry = Unirest.get("http://localhost:3000/api/v2/cars.json").body
    @cars = Car.all
  end
  def show
    @cars = Car.find(params[:id])
  end
  def new
    
  end

  def create
    parameters =
    car = Car.create(
      manufacturer: params[:manufacturer],
      identification_number: params[:identification_number])

    redirect_to "/cars/#{@car['id']}"
  end
  def edit
    @car = Unirest.get("http://localhost:3000/api/v2/cars/#{params[:id]}.json").body
  end
  
  def update
    @car = Unirest.patch("http://localhost:3000/api/v2/cars/#{params[:id]}.json",
      :headers => {"accept" => "application/json"},
      :parameters => {:manufacturer => params[:manufacturer], :identification_number => params[:identification_number]}).body
    redirect_to "/cars/#{@car['id']}"
  end

  def destroy
    @car = Unirest.delete("http://localhost:3000/api/v2/cars/#{params[:id]}.json").body
    redirect_to "/cars"
  end
end
