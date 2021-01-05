class MyCar
  attr_accessor :current_speed, :color
  attr_reader :year

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
end

mark_car = MyCar.new(2008, 'red', 'Saturn Vue')
p mark_car.current_speed
mark_car.speed_up(100)
p mark_car.current_speed
mark_car.brake(50)
p mark_car.current_speed
mark_car.shut_off
p mark_car.current_speed
p mark_car.year
mark_car.color = 'blue'
p mark_car.color
mark_car.spray_paint('gold')
p mark_car.color