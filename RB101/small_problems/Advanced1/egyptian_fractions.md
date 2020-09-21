# P
- rational number: any number that can be represented as the result of the division between two integers
  - numerator / denominator
- unit fraction: a rational number where the numerator is 1
- every positive rational number can be written as an egyptian fraction
  -egyptian fraction: sum of a series of distinct (no two are the same) unit fractions
- input: rational number
- output: array of the denominators that are part of an egyptian fraction representation of the number
- if input is less than or equal to 1 than the EF representation is itself
  - numerator less than the denominator

# E
egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# D
- rational class

# A
 while sum > 0 
  if rational(1,iterator) < sum
    sum -= rational
    result << iterator
  end
  iterator += 1
