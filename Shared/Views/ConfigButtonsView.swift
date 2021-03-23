//
//  ConfigButtonsView.swift
//  GameOfLife
//
//  Created by Chad Parker on 11/9/20.
//

import SwiftUI

struct ConfigButtonsView: View {
    
    @EnvironmentObject var gameModel: GameOfLifeModel
    
    var body: some View {
        HStack {

        // MARK: - Cells

            VStack {
                HStack(spacing: 0) {
                    Button {
                        gameModel.createNewResizedBoard(delta: -1)
                    } label: {
                        Image(systemName: "minus")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding()
                    }
                    
                    Text("CELLS")
                        .foregroundColor(Color(.systemGray))
                        .buttonText()

                    Button {
                        gameModel.createNewResizedBoard(delta: 1)
                    } label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding()
                    }
                }
            }

            Spacer()

            // MARK: - Speed

            VStack {
                HStack(spacing: 0) {
                    Button {
                        gameModel.speedSlower()
                    } label: {
                        Image(systemName: "tortoise.fill")
                            .padding()
                    }
                    
                    Text("SPEED")
                        .foregroundColor(Color(.systemGray))
                        .buttonText()

                    Button {
                        gameModel.speedFaster()
                    } label: {
                        Image(systemName: "hare.fill")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding()
                    }
                }
            }
        }
    }
}

struct ConfigButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigButtonsView()
            .environmentObject(GameOfLifeModel())
    }
}
