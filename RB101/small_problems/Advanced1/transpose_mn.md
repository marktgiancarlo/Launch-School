# P
- a matrix can be transposed by switching columns with rows
- write transpose  method that works with any matrix with at least 1 row and 1 column.
- input: an m x n matrix
- output: an n x m matrix where m input columns are m output rows
[00 01 02 03
 10 11 12 13
 20 21 22 23]
 -->
 [00 10 20
  01 11 21
  02 12 22
  03 13 23]

# Examples
transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]

# Data structures
- nested arrays
- must create rows. can't create columns

# Algorithm
1. iterate thru column idx
2. map each row to new trasposed row
3. append row to result
