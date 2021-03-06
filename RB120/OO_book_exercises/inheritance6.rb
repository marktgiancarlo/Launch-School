module Towable
  def can_tow?(pounds)
    pounds < towing_capacity ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :year, :model, :color

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

  def age()
    "Your #{self.model} is #{years_since} years old."
  end

  private

  def years_since()
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 4

  attr_accessor :towing_capacity

  def initialize(towing_capacity, year, color, model)
    super(year, color, model)
    @towing_capacity = towing_capacity
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 2
  
  attr_accessor :current_speed, :color
  attr_reader :year, :model

  def initialize
    super
  end

end


p marks_truck = MyTruck.new(1000, 1972, 'red', 'Ford F-150')

p marks_truck.age