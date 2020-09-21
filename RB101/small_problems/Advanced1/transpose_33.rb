def transpose(matrix)
  new_matrix = [ [], [], [] ]
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |ele, ele_idx|
      new_matrix[ele_idx][row_idx] = ele
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]