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
        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(store.games) { game in
                            NavigationLink {
                                VStack {
                                    Image(systemName: game.type.imageName)
                                        .font(.system(size: 40))
                                    Text(game.name)
                                        .font(.system(size: 40))
                                }
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
            .environmentObject(ScoreCounterStore())
    }
}
