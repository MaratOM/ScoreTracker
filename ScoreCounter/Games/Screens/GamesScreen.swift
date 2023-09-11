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
    private var fontSize: CGFloat = 20

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
                                                .foregroundColor(.yellow)
                                            Text(game.name)
                                                .font(.system(size: 40))
                                                .foregroundColor(.white)
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Label(game.name, systemImage: game.type.imageName)
                                            .font(.system(size: fontSize))
                                            .foregroundColor(palette.colors.fifth)
                                            .padding(.leading, 20)
                                            .padding(.vertical, 10)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: fontSize))
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
                        Text("Button")
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
