# Game of Life

A delightful iOS version of *Conway's Game of Life*

<img width="300" alt="App screenshot 1" src="https://user-images.githubusercontent.com/438307/111413068-cbf74e80-869a-11eb-805f-e23a8ac67017.png"><img width="300" alt="App screenshot 2" src="https://user-images.githubusercontent.com/438307/111413152-f517df00-869a-11eb-949e-77eeb395fbb0.png">

I made this app during Computer Science build week at Lambda School. Our instruction was primarily in UIKit, but I decided to develop this app in SwiftUI to get more experience with it.  


## Planning

**We need a grid of cells, alive or not.** To make the `Cell`s easily displayed by SwiftUI, I'm storing them in `Row`s, which are easy to display with multiple HStack rows inside of a VStack. I'm also keeping a linear list of all cells (`Cell` is a reference type), to easily loop over all of them. I have a `GameBoard`, which will create and store these lists, which are sized based on inputs of `numRows` and `numCols`.

**Performant calculation of next generation:** I'd rather not calculate each cell's neighbors on every generation, so I'm thinking I can store a list of references to neighboring cells. Partway through this I'm realizing I don't need to hang on to each neighboring cell, but rather just get a count of which neighbors are alive, which gets saved for the calculation of the next generation.

**I was thinking of two GameBoards,** one for the current generation, and one for the next. Which is certainly possible, but it's a copy of a complex data structure that might not be necessary. I'm thinking of an array of booleans that will get applied to the cells after calculation.

`Cell` is a reference type because each cell will stay on screen until the board is reset, and may be stored by reference by multiple objects. [more explanation of `Cell` lifetime]

## Rules

A cell has eight neighbors (up, down, left, right, and diagonals)

For a space that is populated:

* Each cell with one or no neighbors dies, as if by solitude.
* Each cell with two or three neighbors survives.
* Each cell with four or more neighbors dies, as if by overpopulation.

For a space that is empty or unpopulated:

* Each cell with three neighbors becomes populated.
