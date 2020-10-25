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

    let size: Int

    init(size: Int = 9) {
        self.size = size
        // create cells and rows
        for _ in 0..<size {
            let row = Row()
            for _ in 0..<size {
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
            if col < size - 1 {
                neighbors.append(rows[row-1].cells[col+1])
            }
        }
        // add left
        if col > 0 {
            neighbors.append(rows[row].cells[col-1])
        }
        // add right
        if col < size - 1 {
            neighbors.append(rows[row].cells[col+1])
        }
        if row < size - 1 {
            // add lower left
            if col > 0 {
                neighbors.append(rows[row+1].cells[col-1])
            }
            // add lower
            neighbors.append(rows[row+1].cells[col])
            // add lower right
            if col < size - 1 {
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
                if aliveNeighborsCount == 3 {
                    nextAlive = true
                } else {
                    nextAlive = false
                }
            }
            nextList.append(nextAlive)
        }
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

    init(size: Int = 10, speed: Double = 0.5) {
        self.board = GameBoard(size: size)
        self.speed = speed

        board.randomize()
    }

    func startSimulation() {
        running = true
        updateTimer()
    }

    private func updateTimer() {
        if running {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: runLoop)
        }
    }

    func stopSimulation() {
        running = false
        timer?.invalidate()
    }

    func runLoop(timer: Timer) {
        generation += 1

        board.calculateNextGeneration()
    }
    
    func createNewSmallerBoard() {
        let newSize = board.size - 1
        if newSize > 0 {
            board = GameBoard(size: newSize)
        }
    }
    
    func createNewLargerBoard() {
        let newSize = board.size + 1
        if newSize < 100 {
            board = GameBoard(size: newSize)
        }
    }

    func speedSlower() {
        speed *= 1.5
        updateTimer()
    }

    func speedFaster() {
        speed /= 1.5
        updateTimer()
    }
}
