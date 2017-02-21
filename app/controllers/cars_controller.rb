class CarsController < ApplicationController
  def index
    # cars_arry = Unirest.get("http://localhost:3000/api/v2/cars.json").body
    @cars = Car.all
  end
  def show
    @car = Car.find(params[:id])
  end
  def new
    
  end

  def create
    @car = Car.create({manufacturer: params[:manufacturer], identification_number: params[:identification_number]})
    redirect_to "/cars/#{@car.id}"
  end
  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    @car = Car.find(params[:id])
    @car.update({id: params[:id], manufacturer: params[:manufacturer], identification_number: params[:identification_number]})

    redirect_to "/cars/#{@car.id}"
  end

  def destroy
    car = Car.delete(params[:id])
    redirect_to "/cars"
  end
end
