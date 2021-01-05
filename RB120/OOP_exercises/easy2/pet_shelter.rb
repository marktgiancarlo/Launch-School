class Pet
  attr_accessor :name, :pet_type

  def initialize(pet_type, name)
    @pet_type = pet_type
    @name = name
  end
end

class Owner
  attr_accessor :pets, :name
  
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.length
  end
end

class Shelter
  def initialize
    @adopters = []
  end
  
  def adopt(owner, pet)
    owner.pets << pet
    @adopters << owner
  end

  def print_adoptions
    @adopters.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
      adopter.pets.each do |pet|
        puts "a #{pet.pet_type} named #{pet.name}"
      end
      puts ""
    end
  end
end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."