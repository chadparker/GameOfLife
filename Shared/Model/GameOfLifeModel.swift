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

    init(cellCount: Int) {
        for _ in 0..<cellCount {
            cells.append(Cell())
        }
    }
}


// MARK: - Game Model

class GameOfLifeModel: ObservableObject {

    @Published var rows: [Row] = []

    var timer: Timer?
    var speed: Double

    init(numRows: Int = 9, numCols: Int = 9, speed: Double = 0.5) {
        self.speed = speed

        for _ in 0..<numRows {
            rows.append(Row(cellCount: numCols))
        }

        randomizeBoard()
    }

    func clearBoard() {
        for row in rows {
            for cell in row.cells {
                cell.alive = false
            }
        }
    }

    func randomizeBoard() {
        for row in rows {
            for cell in row.cells {
                cell.alive = Bool.random()
            }
        }
    }

    func startSimulation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: runLoop)
    }

    func stopSimulation() {
        timer?.invalidate()
    }

    func runLoop(timer: Timer) {
        print(Int.random(in: 0...99))
    }
}
