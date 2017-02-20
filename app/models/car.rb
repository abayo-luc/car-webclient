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
  def self.create(params)
    car_params = Unirest.post("http://localhost:3000/api/v2/new.json",
      :headers => {"accept" => "application/json"},
      :parameters => params).body
    Car.new(car_params)
  end

  def edit
    @car_id = Unirest.get("http://localhost:3000/api/v2/cars/id.json").body
    Car.new(car_id)
  end

  def self.update(edit_params)
    @car_params_hash = Unirest.patch("http://localhost:3000/api/v2/cars/#{@car_id}.json",
      :headers => {"accept" => "application/json"},
      :parameters => edit_params).body
    Car.new(@car_params_hash)
  end

  def self.delete(id)
      car = Unirest.delete("http://localhost:3000/api/v2/cars/#{id}.json").body
  end
end
