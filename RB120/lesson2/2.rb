# 1. Given the below usage of the Person class, code the class definition.
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    names = full_name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names[1..-1].join(' ') : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
p bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names[1..-1].join(' ') : ''
  end

end

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob.name == rob.name

# 5. Continuing with our Person class definition, what does the below print out?
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
 
# since bob is an instance of Person, interpolating bob won't make much sense unless we've
# overwritten the to_s method. For now, bob returns a string representing the class instance

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def to_s
    name
  end

  private

  def parse_full_name(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names[1..-1].join(' ') : ''
  end

end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"