//
//  CellView.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct CellView: View {

    @EnvironmentObject var gameModel: GameOfLifeModel
    @ObservedObject var cell: Cell

    var size: CGFloat

    var body: some View {
        ZStack {
            Image(systemName: "xmark")
                .font(Font.system(size: size/2, weight: .black))
                .foregroundColor(Color("dead"))

            Button(action: {
                if !gameModel.running {
                    cell.alive.toggle()
                }
            }, label: {
                Square(cornerRadius: size/6)
                    .foregroundColor(.accentColor)
                    .opacity(cell.alive ? 1 : 0)
                    //.frame(width: size, height: size)
            })//.disabled(gameModel.running) // makes button gray. how to customize?
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CellView(cell: Cell(), size: 30)
            CellView(cell: Cell(alive: true), size: 30)
        }
    }
}
