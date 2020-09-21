# P
- take an arbitrary m x n matrix and rotate it 90 degrees clockwise
- returns a new matrix; dont modify original matrix
- first row becomes last column; middle row becomes middle column; last row becomes first column
  - last column backwards becomes last row; first column backwards becomes first row

# E
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# D
- nested arrays

# A
- map column to new row
- append to result matrix


*problem: map column to new row*
rules/requirements
- while we iterate thru original matrix by column we want the new row col idx to change more slowly than the row idx
