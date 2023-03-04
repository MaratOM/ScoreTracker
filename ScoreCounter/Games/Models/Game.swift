//
//  Game.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

struct Game {
    let name: String
    let type: GameType
}

extension Game: Identifiable {
    var id: String { name }
}
