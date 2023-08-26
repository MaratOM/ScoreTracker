//
//  ScoreCounterData.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 26.08.2023.
//

import Foundation

import Foundation

struct ScoreCounterData {
    struct Games {
        static let uno = Game(name: "Uno", type: .up)
        static let domino = Game(name: "Domino", type: .down)
        static let chess = Game(name: "Chess", type: .single)
    }
    
    struct Players {
        static let john = Player(name: "John", avatar: "😎")
        static let paul = Player(name: "Paul", avatar: "🤩")
        static let george = Player(name: "George", avatar: "😵‍💫")
        static let ringo = Player(name: "Ringo", avatar: "🥸")
    }

    struct Matches {
        static let match1Players = [Players.george, Players.ringo]
        static let match1 = Match(
            id: UUID(),
            game: Games.uno,
            players: match1Players,
            winScore: 300,
            rounds: [],
            winner: nil
        )
        
        static let match2Players = [Players.george, Players.ringo, Players.paul]
        static let match2Rounds: [Round] = [
            .init(
                scores: [
                    .init(player: match2Players[0], score: 104),
                    .init(player: match2Players[1], score: 123),
                    .init(player: match2Players[2], score: 156),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 91),
                    .init(player: match2Players[1], score: 34),
                    .init(player: match2Players[2], score: 103),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 40),
                    .init(player: match2Players[1], score: 110),
                    .init(player: match2Players[2], score: 23),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 56),
                    .init(player: match2Players[1], score: 41),
                    .init(player: match2Players[2], score: 112),
                ]
            ),
        ]
        static let match2 = Match(
            id: UUID(),
            game: Games.uno,
            players: match2Players,
            winScore: 300,
            rounds: match2Rounds,
            winner: match2Players[2]
        )
    }
}
