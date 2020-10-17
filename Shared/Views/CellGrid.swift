//
//  CellGrid.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/14/20.
//

import SwiftUI

struct CellGrid: View {

    let spacing: CGFloat = 2

    @ObservedObject var gameModel = GameOfLifeModel()

    let data = (1...25).map { "\($0)" }
    var columns = [GridItem]()

    init() {
        columns = [GridItem(.fixed(30), spacing: spacing),
                   GridItem(.fixed(30), spacing: spacing),
                   GridItem(.fixed(30), spacing: spacing),
                   GridItem(.fixed(30), spacing: spacing),
                   GridItem(.fixed(30), spacing: spacing),]
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(data, id: \.self) { item in
                Cell(size: 30, alive: true)
            }
        }
    }
}




struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        CellGrid()
    }
}
