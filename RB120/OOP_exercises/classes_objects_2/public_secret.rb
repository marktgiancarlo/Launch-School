class Person
  attr_writer :secret
  attr_reader :secret

  def initialize
    @secret = nil
  end

end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret


