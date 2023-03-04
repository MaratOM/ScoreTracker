//
//  GamesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

struct Game {
    let name: String
    let type: GameType
}

extension Game: Identifiable {
    var id: String {
        name
    }
}

enum GameType {
    case up
    case down
    case single
    
    var imageName: String {
        switch self {
        case .up:
            return "arrow.up.square"
        case .down:
            return "arrow.down.square"
        case .single:
            return "scope"
        }
    }
}

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
