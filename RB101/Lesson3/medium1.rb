#Q1
10.times {|x| puts (" " * x) + "The Flintstones Rock!"}

#Q2
#can't add a string with an integer
#convert to string or interpolate

#Q3
while divisor > 0 do
  #factor check
end

#Q4
#both methods have same return value but
#First method is mutating the original array
#Second method is returning a new array

#Q5
#limit is unaccessible within the method def.
#add as additional arg to method

#Q6
#34

#Q7
#the object id of the munsters hash is passed in and while
#the object ids of the internal components of that hash are
#reassigned, the munsters hash is not. Thus, when spot runs his
#method is WILL mess with the family data

#Q8
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
puts rps(rps("paper", "rock"), "rock")
puts rps("paper", "rock")
puts "paper"

#Q9
"no"