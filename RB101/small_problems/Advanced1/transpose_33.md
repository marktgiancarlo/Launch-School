# P
**rules/requirements**
- transpose 3x3 matrix
- do not modify the original matrix
- 1 5 8 4 7 2 3 9 6 -> 1 4 3 5 7 9 8 2 6

# Examples
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Data Structures
- nested arrays

# Algorithm
- loop thru 3 times
- 1st row values into first elements of transposed rows

1. init new 3x3 matrix
2. take all elements of nth row and assign each to the nth element of the transposed rows
3. repeat 3 times

