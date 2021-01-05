class Vehicle
  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "#{@@number_of_vehicles} have been created!"
  end

  def speed_up(mph)
    self.current_speed += mph
  end

  def brake(mph)
    self.current_speed -= mph
  end

  def shut_off()
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def self.mpg(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas."
  end

  def to_s()
    puts "My car is a #{color}, #{year}, #{model}"
  end
end

class MyTruck
  NUMBER_OF_DOORS = 4

  def initialize
    self
  end

end

class MyCar
  NUMBER_OF_DOORS = 2
  
  attr_accessor :current_speed, :color
  attr_reader :year, :model

  def initialize
    self
  end

end