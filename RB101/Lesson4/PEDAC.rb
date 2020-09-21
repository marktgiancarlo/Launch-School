
def sum_even_number_row(row_number)
  rows = []
  current_start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(current_start_integer, current_row_number)
    current_start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row_array = [start_integer]
  until row_array.length == row_length
    row_array << row_array.last + 2
  end
  return row_array
end


# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10 # true
p sum_even_number_row(4) == 68 # true

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4,6]
# start: 8, length: 3 --> [8,10,12]

p create_row(2, 1) == [2] # true
p create_row(4, 2) == [4, 6] # true
p create_row(8, 3) == [8, 10, 12] # true
