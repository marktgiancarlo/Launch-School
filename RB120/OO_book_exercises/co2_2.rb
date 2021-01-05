class MyCar
  attr_accessor :current_speed, :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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

mark_car = MyCar.new(2008, 'red', 'Saturn Vue')
puts mark_car