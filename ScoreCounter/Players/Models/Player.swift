//
//  Player.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import Foundation

struct Player: Identifiable, Equatable {
    let id: UUID = UUID()
    let name: String
    let avatar: String
}
