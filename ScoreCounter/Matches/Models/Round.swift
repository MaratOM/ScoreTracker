//
//  Round.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import Foundation

struct Round {
    let scores: [Score]
}

extension Round: Identifiable {
    var id: UUID { UUID() }
}
