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

    func clear() {
        cells.forEach { $0.alive = false }
    }

    func randomize() {
        cells.forEach { $0.alive = Bool.random() }
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
        print(generation)
    }
}
