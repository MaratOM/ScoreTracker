//
//  initialData.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import Foundation

final class ScoreCounterData: ObservableObject {
    @Published var games: [Game] = [
        .init(name: "Uno", type: .up),
        .init(name: "Domino", type: .down),
        .init(name: "Chess", type: .single),
    ]
    
    @Published var players: [Player] = [
        .init(id: UUID().uuidString, name: "John", avatar: "😎"),
        .init(id: UUID().uuidString, name: "Paul", avatar: "🤩"),
        .init(id: UUID().uuidString, name: "George", avatar: "😵‍💫"),
        .init(id: UUID().uuidString, name: "Ringo", avatar: "🥸"),
    ]
}
