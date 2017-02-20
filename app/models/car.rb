class Car
  attr_accessor :id, :identification_number, :manufacturer
  def initialize(hash)
    @id = hash['id']
    @identification_number = hash['identification_number']
    @manufacturer = hash['manufacturer']
  end

  def self.find(id)
    car_hash= Unirest.get("http://localhost:3000/api/v2/cars/#{id}.json").body
    Car.new(car_hash)
  end

  def self.all
    car_hashs = Unirest.get("http://localhost:3000/api/v2/cars.json").body
    cars = []
    car_hashs.each do |car_hash|
       cars << Car.new(car_hash)
    end
    return cars
  end
  def self.create
    car_params = Unirest.post("http://localhost:3000/api/v2/new.json",
      :headers => {"accept" => "application/json"},
      :parameters => {:manufacturer => params[:manufacturer], :identification_number => params[:identification_number]}).body
    Car.new(car_params)
  end
end
