class Cat
  attr_reader :name
  attr_writer :name
  
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hello. My name is #{self.name}."
  end

end

kitty = Cat.new('Sophie')
kitty.name = 'Luna'
kitty.greeting