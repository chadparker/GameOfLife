//
//  Cell.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct Cell: View {

    var size: CGFloat = 30
    @State var alive: Bool = false

    var body: some View {
        ZStack {
            Image(systemName: "xmark")
                .font(Font.system(size: size/2.0, weight: .black))
                .foregroundColor(Color("dead"))

            Button(action: {
                alive.toggle()
            }, label: {
                Square(cornerRadius: size/6)
                    .foregroundColor(Color("alive"))
                    .opacity(alive ? 1 : 0)
                    .frame(width: size, height: size)
            })
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Cell(alive: false)
            Cell(alive: true)
        }
    }
}
