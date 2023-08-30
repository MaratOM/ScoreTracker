//
//  Match.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 26.08.2023.
//

import Foundation

struct Match: Identifiable, Equatable {
    static func == (lhs: Match, rhs: Match) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID
    let game: Game
    let date: Date
    let players: [Player]
    var winScore: Int
    var rounds: [Round]
    var winner: Player?
}
