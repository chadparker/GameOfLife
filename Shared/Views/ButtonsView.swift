//
//  ButtonsView.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/20/20.
//

import SwiftUI

struct ButtonsView: View {

    @EnvironmentObject var gameModel: GameOfLifeModel
    @Binding var showingInfo: Bool

    var body: some View {
        VStack {
            HStack {
                
                // MARK: - Reset

                Button {
                    
                } label: {
                    VStack {
                        Image(systemName: "arrow.counterclockwise")
                            .font(Font.system(size: 30, weight: .bold))
                            .padding(1)
                            .padding(.top)
                        Text("RESET")
                            .buttonText()
                            .padding(.bottom)
                    }
                    .foregroundColor(gameModel.running ? .accentColor : Color(.systemGray4))
                    .padding(.horizontal)
                }
                .hidden()

                Spacer()

                
                
                // MARK: - Start / Pause
                
                if gameModel.running {
                    Button {
                        gameModel.pauseSimulation()
                    } label: {
                        VStack {
                            Image(systemName: "pause.fill")
                                .font(Font.system(size: 30, weight: .bold))
                                .padding(1)
                                .padding(.top)
                            Text("PAUSE")
                                .buttonText()
                                .padding(.bottom)
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Button {
                        gameModel.startSimulation()
                    } label: {
                        VStack {
                            Image(systemName: "play.fill")
                                .font(Font.system(size: 30, weight: .bold))
                                .padding(1)
                                .padding(.top)
                            Text("START")
                                .buttonText()
                                .padding(.bottom)
                        }
                        .foregroundColor(gameModel.running ? Color(.systemGray4) : Color(.link))
                        .padding(.horizontal)
                    }
                }

                Spacer()
                
                // MARK: - Info

                Button {
                    showingInfo.toggle()
                } label: {
                    VStack {
                        Image(systemName: "info.circle")
                            .font(Font.system(size: 30, weight: .bold))
                            .padding(1)
                            .padding(.top)
                        Text("INFO")
                            .buttonText()
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                .hidden()
            }
            .frame(maxWidth: .infinity)


            // MARK: - Seed / Clear grid

            HStack {

                Button {
                    gameModel.board.randomize()
                } label: {
                    VStack {
                        Image(systemName: "die.face.3")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding(1)
                            .padding(.top)
                        Text("RANDOMIZE")
                            .buttonText()
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                }

                Button {
                    gameModel.board.clear()
                } label: {
                    VStack {
                        Image(systemName: "clear")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding(1)
                            .padding(.top)
                        Text("CLEAR")
                            .buttonText()
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.top)
    }
}


// MARK: - Preview

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(showingInfo: .constant(false))
            .environmentObject(GameOfLifeModel())
    }
}
