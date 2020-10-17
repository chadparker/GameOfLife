//
//  CellView.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct CellView: View {

    @ObservedObject var cell: Cell

    var size: CGFloat = 30

    var body: some View {
        ZStack {
            Image(systemName: "xmark")
                .font(Font.system(size: size/2, weight: .black))
                .foregroundColor(Color("dead"))

            Button(action: {
                cell.alive.toggle()
            }, label: {
                Square(cornerRadius: size/6)
                    .foregroundColor(Color("alive"))
                    .opacity(cell.alive ? 1 : 0)
                    .frame(width: size, height: size)
            })
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CellView(cell: Cell())
            CellView(cell: Cell(alive: true))
        }
    }
}
