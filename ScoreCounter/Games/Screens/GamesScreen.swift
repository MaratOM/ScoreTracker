//
//  GamesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

struct GamesScreen: View {
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        let games = store.games

        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(games) { game in
                            NavigationLink {
                                Text(game.name)
                                    .font(.system(size: 40))
                            } label: {
                                Label(game.name, systemImage: game.type.imageName)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .padding()
                }

                AddItemView(linkView: AddGameScreen())
            }
            .navigationTitle("Games")
        }
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
            .environmentObject(ScoreCounterStore())
    }
}
