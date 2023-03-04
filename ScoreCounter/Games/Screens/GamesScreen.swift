//
//  GamesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

struct GamesScreen: View {
    @State private var games: [Game] = [
        .init(name: "Uno", type: .up),
        .init(name: "Domino", type: .down),
        .init(name: "Chess", type: .single),
    ]
    
    var body: some View {
        NavigationView {
            List(games) { game in
                NavigationLink {
                    Text(game.name)
                        .font(.system(size: 40))
                } label: {
                    Label(game.name, systemImage: game.type.imageName)
                }
            }
            .navigationTitle("Games")
        }
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
    }
}
