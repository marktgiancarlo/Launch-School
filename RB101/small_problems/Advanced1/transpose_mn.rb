require 'pry'

def transpose(matrix)
  num_columns = matrix[0].length
  num_rows = matrix.length
  new_matrix = []
  (0..num_columns-1).each do |col_idx|
    new_row = (0..num_rows-1).map { |row_idx| matrix[row_idx][col_idx] }
    new_matrix << new_row
  end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]