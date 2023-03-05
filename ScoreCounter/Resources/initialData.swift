//
//  initialData.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import Foundation

final class ScoreCounterStore: ObservableObject {
    @Published var games: [Game] = [
        .init(name: "Uno", type: .up),
        .init(name: "Domino", type: .down),
        .init(name: "Chess", type: .single),
    ]
    
    @Published var players: [Player] = [
        .init(name: "John", avatar: "😎"),
        .init(name: "Paul", avatar: "🤩"),
        .init(name: "George", avatar: "😵‍💫"),
        .init(name: "Ringo", avatar: "🥸"),
    ]
    
    @Published var chosenAvatar = ""
}
