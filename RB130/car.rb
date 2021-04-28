class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

puts Car.new.object_id
puts Car.new.object_id
