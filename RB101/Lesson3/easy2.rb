#Q1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.key?("Spot")

#Q2
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase
munsters_description.capitalize
munsters_description.downcase
munsters_description.upcase

#Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge(additional_ages)

#Q4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include? "Dino"
advice.match?("Dino")

#Q5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

#Q6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

#Q7
flintstones.push("Dino").push("Hoppy")

#Q8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!("Few things in life are as important as ")
advice.slice!(0, advice.index('house'))

#Q9
statement = "The Flintstones Rock!"
statement.count('t')

#Q10
title = "Flintstone Family Members"
title.center(40)