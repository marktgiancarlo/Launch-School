#Q1
1
2
2
3

#Q2
#! or ? at the end of a method is part of the method name, not ruby syntax
#!= means not equals
#? : is the ternary operator
#!! turns any object into its boolean equivalent
#! turns any object into the opposite of its boolean equivalent

#Q3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")

#Q4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) #=> [1,3,4,5]
numbers = [1, 2, 3, 4, 5]
numbers.delete(1) #=> [2,3,4,5]

#Q5
(10..100).include?(42)
(10..100).cover?(42)

#Q6
famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
famous_words.prepend("Four score and ")

#Q7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

#Q8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")