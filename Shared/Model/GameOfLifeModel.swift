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

    init(numRows: Int = 9, numCols: Int = 9) {
        for _ in 0..<numRows {
            let row = Row()
            for _ in 0..<numCols {
                let cell = Cell()
                cells.append(cell) // linear list of cells
                row.cells.append(cell) // rows of cells
            }
            rows.append(row)
        }
    }

    func clear() {
        cells.forEach { $0.alive = false }
    }

    func randomize() {
        cells.forEach { $0.alive = Bool.random() }
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
