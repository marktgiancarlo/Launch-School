# P
input: 2 sorted arrays
output: new array that contains all elements of arg arrays in sorted order
**rules/requirements**
- cannot sort the combined array
- must build result array one element at a time in the proper order
- cannot mutate the input arrays
- assuming that arrays only contain numbers
  - not comparing across data types
- since they are both sorted arrays, next element of result array will be the smaller of the leftmost unselected elements of the arrays.

# E
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

# D
- arrays

# A
1. create result array
2. compare leftmost unselected elements of the two arrays
3. add lower of two elements to result array
4. repeat until all elements selected

*compare leftmost unselected elements*
- what if empty array?
- how do we know if they are unselected?
[1, 3, 5] [2, 4, 6]

***use each to avoid iterating past length of array***