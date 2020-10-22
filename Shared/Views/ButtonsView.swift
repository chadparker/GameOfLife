//
//  ButtonsView.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/20/20.
//

import SwiftUI

struct ButtonsView: View {

    @EnvironmentObject var gameModel: GameOfLifeModel

    var body: some View {
        VStack {
            
            HStack {
                Button {
                    gameModel.startSimulation()
                } label: {
                    Text("START")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .foregroundColor(gameModel.running ? Color(.systemGray4) : Color(.link))
                        .padding()
                }

                Button {
                    gameModel.stopSimulation()
                } label: {
                    Text("STOP")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .foregroundColor(gameModel.running ? .accentColor : Color(.systemGray4))
                        .padding()
                }
            }

            HStack {

                Button {
                    gameModel.randomizeBoard()
                } label: {
                    Text("RANDOMIZE")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .padding()
                }

                Button {
                    gameModel.clearBoard()
                } label: {
                    Text("CLEAR")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .padding()
                }
            }
        }
        .padding(.top)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView().environmentObject(GameOfLifeModel())
    }
}