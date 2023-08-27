//
//  Match.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 26.08.2023.
//

import Foundation

struct Match: Identifiable {
    let id: UUID
    let game: Game
    let date: Date
    let players: [Player]
    let winScore: UInt
    let rounds: [Round]
    let winner: Player?
}
