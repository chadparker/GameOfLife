//
//  CellGrid.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/14/20.
//

import SwiftUI

// TODO: rename to GridView
struct CellGrid: View {

    @EnvironmentObject var gameModel: GameOfLifeModel

    var body: some View {
        VStack {
            ForEach(gameModel.rows) { row in
                HStack {
                    ForEach(row.cells) { cell in
                        CellView(cell: cell)
                    }
                }
            }
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        CellGrid()
            .environmentObject(GameOfLifeModel())
    }
}
