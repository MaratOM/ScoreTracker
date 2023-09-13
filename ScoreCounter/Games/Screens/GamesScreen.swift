//
//  GamesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI
import UIDesignSystem

struct GamesScreen: View {
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        let palette = UIDesignSystemStore.palette

        NavigationView {
            ZStack {
                BackgroundMain()

                VStack {
                    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, alignment: .leading) {
                            ForEach(store.games) { game in
                                NavigationLink {
                                    ZStack {
                                        LinearGradient(
                                            colors: [
                                                palette.colors.first,
                                                palette.colors.second,
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
                                        .edgesIgnoringSafeArea(.all)
                                        VStack {
                                            Image(systemName: game.type.imageName)
                                                .font(.system(size: 40))
                                                .foregroundColor(store.palette.colors.fourth)
                                            Texts.h1(game.name).view
                                        }
                                    }
                                } label: {
                                    HStack {
                                        HStack {
                                            Image(systemName: game.type.imageName)
                                                .foregroundColor(palette.colors.fifth)
                                            Texts.h4(game.name).view
                                        }
                                        .padding(.leading, 20)
                                        .padding(.vertical, 10)
                                        
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 20))
                                            .foregroundColor(palette.colors.fifth)
                                            .padding(.trailing, 20)
                                    }
                                    .background(palette.colors.second)
                                    .cornerRadius(14)
//                                    .clipShape(Capsule())
                                }
                                .padding(.bottom, 10)
                            }
                        }
                        .padding()
                    }

                    AddItemButton(linkView: AddGameScreen())

                    Button {
                        withAnimation {
                            store.palette = store.palette == .green ? .purple2 : .green
                        }
                    } label: {
                        Texts.h3("Change Theme").view
                            .opacity(0.5)
                    }
                }
                .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
            .environmentObject(ScoreCounterStore())
    }
}
