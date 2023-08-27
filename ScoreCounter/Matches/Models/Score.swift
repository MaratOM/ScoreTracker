//
//  Score.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import Foundation

struct Score {
    let player: Player
    let score: Int
}

extension Score: Identifiable {
    var id: UUID { UUID() }
}
