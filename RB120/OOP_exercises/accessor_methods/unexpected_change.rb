class Person
  def name=(name)
    names = name.split(' ')
    @first_name = names[0]
    @last_name = names[1]
  end

  def name
    @first_name + ' ' + @last_name
  end
  
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name