//
//  GridView.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/14/20.
//

import SwiftUI

struct GridView: View {

    @EnvironmentObject var gameModel: GameOfLifeModel

    let size: CGFloat

    var body: some View {
        VStack {
            ForEach(gameModel.board.rows) { row in
                HStack {
                    ForEach(row.cells) { cell in
                        CellView(cell: cell, size: size/CGFloat(gameModel.board.numCols))
                    }
                }
            }
        }.frame(width: size, height: size)
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        GridView(size: 350)
            .environmentObject(GameOfLifeModel())
    }
}
