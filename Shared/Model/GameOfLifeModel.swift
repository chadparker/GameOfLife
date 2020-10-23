//
//  GameOfLifeModel.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/14/20.
//

import SwiftUI

// MARK: - Cell

class Cell: Identifiable, ObservableObject {

    @Published var alive: Bool
    var neighbors: [Cell] = []

    init(alive: Bool = false) {
        self.alive = alive
    }
}


// MARK: - Row

class Row: Identifiable {

    var cells: [Cell] = []
}


// MARK: - Game Board

class GameBoard {

    var cells: [Cell] = []
    var rows: [Row] = []

    let numRows: Int
    let numCols: Int

    init(numRows: Int = 9, numCols: Int = 9) {
        self.numRows = numRows
        self.numCols = numCols
        // create cells and rows
        for _ in 0..<numRows {
            let row = Row()
            for _ in 0..<numCols {
                let cell = Cell()
                cells.append(cell) // linear list of cells
                row.cells.append(cell) // rows of cells
            }
            rows.append(row)
        }
        // assign neigbor references to each cell
        for (rowIndex, row) in rows.enumerated() {
            for (colIndex, cell) in row.cells.enumerated() {
                cell.neighbors = findCellNeighbors(row: rowIndex, col: colIndex)
            }
        }
    }

    private func findCellNeighbors(row: Int, col: Int) -> [Cell] {
        var neighbors: [Cell] = []
        if row > 0 {
            // add upper left
            if col > 0 {
                neighbors.append(rows[row-1].cells[col-1])
            }
            // add upper
            neighbors.append(rows[row-1].cells[col])
            // add upper right
            if col < numCols - 1 {
                neighbors.append(rows[row-1].cells[col+1])
            }
        }
        // add left
        if col > 0 {
            neighbors.append(rows[row].cells[col-1])
        }
        // add right
        if col < numCols - 1 {
            neighbors.append(rows[row].cells[col+1])
        }
        if row < numRows - 1 {
            // add lower left
            if col > 0 {
                neighbors.append(rows[row+1].cells[col-1])
            }
            // add lower
            neighbors.append(rows[row+1].cells[col])
            // add lower right
            if col < numCols - 1 {
                neighbors.append(rows[row+1].cells[col+1])
            }
        }
        return neighbors
    }

    func clear() {
        cells.forEach { $0.alive = false }
    }

    func randomize() {
        cells.forEach { $0.alive = Bool.random() }
    }

    func calculateNextGeneration() {
        var nextList: [Bool] = []
        for cell in cells {
            let aliveNeighborsCount = cell.neighbors.filter { $0.alive }.count
            var nextAlive: Bool
            if cell.alive {
                switch aliveNeighborsCount {
                case 0...1:
                    nextAlive = false
                case 2...3:
                    nextAlive = true
                default:
                    nextAlive = false
                }
            } else {
                if cell.neighbors.count == 3 {
                    nextAlive = true
                } else {
                    nextAlive = false
                }
            }
            nextList.append(nextAlive)
        }
        //assert(nextList.count == cells.count)
        for i in 0..<cells.count {
            cells[i].alive = nextList[i]
        }
    }
}


// MARK: - Game Model

class GameOfLifeModel: ObservableObject {

    @Published var board: GameBoard
    @Published var running = false
    @Published var generation = 0

    var timer: Timer?
    var speed: Double

    init(numRows: Int = 9, numCols: Int = 9, speed: Double = 0.5) {
        self.board = GameBoard(numRows: numRows, numCols: numCols)
        self.speed = speed

        board.randomize()
    }

    func startSimulation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: runLoop)
        running = true
    }

    func stopSimulation() {
        timer?.invalidate()
        running = false
    }

    func runLoop(timer: Timer) {
        generation += 1

        board.calculateNextGeneration()
    }
}
