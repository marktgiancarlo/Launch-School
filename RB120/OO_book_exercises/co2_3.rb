class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"


# throws an error because there is no setter method for the name variable.
# change attr-reader to attr-writer or attr-accessor