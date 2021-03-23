//
//  MainView.swift
//  Shared
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var gameModel: GameOfLifeModel
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Image("header")
                    .padding(.vertical, g.size.height/100)
                HStack {
                    Spacer()
                    Text("Generation")
                        .foregroundColor(Color(.systemGray))
                        .buttonText()
                    Text("\(gameModel.generation)")
                        .buttonText()
                        .padding(.trailing, 10)
                }
                GridView(size: g.size.width)
                ButtonsView()
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environmentObject(GameOfLifeModel())
        }
    }
}
