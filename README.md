# Game of Life

*Conway's Game of Life* for CS build week, iOS, SwiftUI

## Plan

**We need a grid of cells, alive or not.** To make the `Cell`s able to be displayed, I'm storing them in `Row`s, which are easy to display with HStack rows in a VStack. I'm also keeping a linear list of all cells, to easily loop over all of them. I have a `GameBoard`, which will create and store these lists, which are sized based on inputs of `numRows` and `numCols`.

**Performant calculation of next generation:** I'd rather not calculate each cell's neighbors on every generation, so I'm thinking I can store a list of references to neighboring cells. Partway through this I'm realizing I don't need to hang on to each cell, but rather just get a count of which neighbors are alive, which gets saved for the calculation of the next generation.

**I was thinking of two GameBoards,** one for the current generation, and one for the next. Which is certainly possible, but it's a copy of a complex data structure that might not be necessary. I'm thinking of an array of booleans that will get applied to the cells after calculation.

## Rules

A cell has eight neighbors (up, down, left, right, and diagonals)

For a space that is populated:

* Each cell with one or no neighbors dies, as if by solitude.
* Each cell with two or three neighbors survives.
* Each cell with four or more neighbors dies, as if by overpopulation.

For a space that is empty or unpopulated:

* Each cell with three neighbors becomes populated.
