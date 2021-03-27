//
//  MainView.swift
//  Shared
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var gameModel: GameOfLifeModel
    @State var showingInfo = false
    
    var body: some View {
        ZStack {
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
                    ConfigButtonsView()
                    ButtonsView(showingInfo: $showingInfo)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            InfoView()
                .opacity(showingInfo ? 1 : 0)
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
