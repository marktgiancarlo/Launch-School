## PEDAC

## P: [Understanding the] Problem

- Establish the rules/ define the boundaries of the problem
    - Assessing all the available information about the problem
    - Restate explicit requirements
        - Explicit requirements: those that are clearly stated in the problem description
    - Identify implicit requirements
        - Implicit requirements: those that are not stated in the problem description but can be extrapolated form our understanding of the problem based on problem analysis, test cases, examples, …
- Spend enough time. Don’t rush this step.

**GENERAL EXAMPLE**
Given a string, produce a new string with every other word removed.

- Explicit requirements:
    - Input: string
    - Output: new string
    - Remove every other word from the input string
- Questions:
    - What do we mean by every other word?
    - How do we define a word in this context?
        - Words are delimited by spaces


## E: Examples and Test Cases

- Examples can with expanding understanding and clarifying that understanding. Can use them to either confirm or refute assumptions we've made about the problem and help answer questions regarding implicit requirements.
- Test cases are examples using the specific syntax of programming languages and structured in such a way as to to test a particular input against an expected output.
- Can both act as assertions that help us codify the rules and boundaries of our problem.

- Can confirm or refute assumptions
- Help to answer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries of the problem

## D: Data Structures

- Help reason with data logically
- Help interact with data at implementation level
- Thinking in terms of data structures is part of problem-solving process
- Data structures closely linked to algorithms
    - Set of steps from input to output
        - Involves structuring data in a certain way


## A: Algorithms

- A logical sequence of steps for accomplishing a task or objective
  - Closely linked to data structures
  - Series of steps to structure data to produce the required output
- Stay abstract and high-level
  - Avoid implementation detail
  - Don't worry about efficiency for now

## C: Implementing a solution in Code

- Translating solution algorithm to code
- Think about algorithms in context of programming language
  - Language features and constraints
  - Characteristics of data structures
  - Built in functions/ methods
  - Syntax and coding patterns
- Create test cases
- Code with intent


## PEDAC Example: Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row containing two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Understand the problem**
Start by restating certain elements of the description in such a way as to extract the explicit and implicit requirements and help define the rules and boundaries of the problem

**Rules/ requirements**
- Sequence of even integers
- Sequence begins with two
- The integers are consecutive
- The sequence is grouped into rows
- Each row is incrementally larger than the last: 1, 2, 3, ...
- Row 'number' that we're given equals the number of elements in that row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row identified by the input integer
- Sequence: 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, ...
- Rows: 2
        4, 6
        8, 10, 12
        14, 16, 18, 20
        ...
- How do we create the structure?
  - Create as we need it based on input and then obtain relevant data

**Examples/test cases**
row number: 1 --> sum of integers in row: 2
2 --> 2
row number: 2 --> sum of integers in row: 10
4, 6 --> 10
row number: 4 --> sum of integers in row: 68
14, 16, 18, 20 --> 68

**Data Structures**
2
4, 6
8, 10, 12
14, 16, 18, 20
...
- Overall structure representing sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4,6],
  [8,10,12],
  [14,16,18,20],
  ...
]

**Algorithm**
1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
  - All rows have been created when the length of the rows array is equal to the input integer
4. Sum the final rows
5. Return the sum

*Problem: Create a Row*
Rules:
- Row is an array
- Arrays contain integers
- Integers are consecutive even nnumbers
- Integers in each row form part of a larger overall sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4,6]
start: 8, length: 3 --> [8,10,12]

Data Structures:
- An array of integers

Algorithm:
1. Create an empty 'row' to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 and 3 until the array has reached the correct length
5. Return the 'row' array

*Calculating the start integer*
Rules:
- First intger of row == last integer of preceding row + 2
Algorithm
- Get the last row of the 'rows' array
- Get last integer of that row
- Add 2 to that integer

## Final Thoughts
- Not a completely linear process
  - Be prepared to move back and forward between the steps
  - Switch from implementation mode to abstract problem solving mode when necessary
- Don't try to problem solve at the code level