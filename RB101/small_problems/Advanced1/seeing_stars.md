# P
- understand the problem
**rules/requirements**
- display an 8-pointed start in an n x n grid
- n is an odd integer supplied as an argument
- smallest possible grid is 7 x 7
- 3 stars per row except middle row whhich is all stars
- each row is n spaces wide

# E
- examples provided

# D
- data structures
- individual strings that we print by line
- nested arrays would work but arrays print vertically not horizontally

# A
- Algorithm

1. print contracting rows (1st - middle minus 1)
2. print middle row
  - prints line of length n containing only stars
3. print expanding rows (middle+1 - last)

*problem: print contracting rows*
rules/requirements:
- each row is a string
- each string is the same length n
- each row contains 3 stars
- input: length of row n
  - odd number
- output: printed string
- row composition
7 rows
Row 1: 0*2*2*0  0 (n-3)/2 0
Row 2: 1*1*1*1  +1 -1 +1
Row 3: 2*0*0*2  +1 -1 +1 
Row 4: *******
Row 5: 2*0*0*2  = = =
Row 6: 1*1*1*1  -1 +1 -1
Row 7: 0*2*2*0  -1 +1 -1

9 rows
Row 1: 0*3*3*0  0 (n-3)/2 0
Row 2: 1*2*2*1  +1 -1 +1
Row 3: 2*1*1*2  +1 -1 +1
Row 4: 3*0*0*3  +1 -1 +1
Row 5: *******
Row 6: 3*0*0*3  = = =
Row 7: 2*1*1*2  -1 +1 -1
Row 8: 1*2*2*1  -1 +1 -1
Row 9: 0*3*3*0  -1 +1 -1
- star placement defined in terms of spaces between edges or between stars
  - space between last star and right edge irrelevant
- 2 types of space spaces
  - between 1st star and left edge
    - starts at 0 and increments by 1 for each new row
  - between 1st and 2nd star; between 2nd and 3rd star
    - starts at (n-3)/2 and increments by -1 for each new row
- 'contraction' is over when space between stars is 0
  - middle row of grid; n/2 +1
1. init empty string
2. add left edge spaces
3. add star
4. add star spaces
5. add star
6. add star spaces
7. add star
8. print string
9. repeat 1-8 for all contracting rows

*problem: print expanding rows*
- star placement defined in terms of spaces between edges or between stars
  - space between last star and right edge irrelevant
- 2 types of space spaces
  - between 1st star and left edge
    - starts at (n-3)/2 and increments by -1 for each new row
  - between 1st and 2nd star; between 2nd and 3rd star
    - starts at 0 and increments by 1 for each new row
- 'expansion' is over when space between left edge and first star is 0
  - last row