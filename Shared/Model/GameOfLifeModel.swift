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

    var rows: Int
    var cols: Int
}
