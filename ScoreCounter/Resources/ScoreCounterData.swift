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
        static let cards = Game(name: "Cards", type: .up)
    }
    
    struct Players {
        static let me = Player(name: "Me", avatar: "😎")
        static let john = Player(name: "John", avatar: "😀")
        static let paul = Player(name: "Paul", avatar: "🤩")
        static let george = Player(name: "George", avatar: "😵‍💫")
        static let ringo = Player(name: "Ringo", avatar: "😊")
    }

    struct Matches {
        static let match1Players = [Players.me, Players.george, Players.ringo]
        static let match1Rounds: [Round] = [
            .init(
                scores: [
                    .init(player: match1Players[0], score: 11),
                    .init(player: match1Players[1], score: 23),
                    .init(player: match1Players[2], score: 32),
                ]
            ),
            .init(
                scores: [
                    .init(player: match1Players[0], score: 2),
                    .init(player: match1Players[1], score: 35),
                    .init(player: match1Players[2], score: 52),
                ]
            ),
        ]
        static let match1 = Match(
            id: UUID(),
            game: Games.uno,
            date: Calendar.current.date(byAdding: .hour, value: -1, to: Date())!,
            players: match1Players,
            winScore: 300,
            rounds: match1Rounds,
            winner: nil
        )
        
        static let match2Players = [Players.george, Players.me, Players.ringo, Players.paul]
        static let match2Rounds: [Round] = [
            .init(
                scores: [
                    .init(player: match2Players[0], score: 104),
                    .init(player: match2Players[1], score: 123),
                    .init(player: match2Players[2], score: 156),
                    .init(player: match2Players[3], score: 45),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 91),
                    .init(player: match2Players[1], score: 34),
                    .init(player: match2Players[2], score: 103),
                    .init(player: match2Players[3], score: 79),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 40),
                    .init(player: match2Players[1], score: 110),
                    .init(player: match2Players[2], score: 67),
                    .init(player: match2Players[3], score: 134),
                ]
            ),
            .init(
                scores: [
                    .init(player: match2Players[0], score: 56),
                    .init(player: match2Players[1], score: 41),
                    .init(player: match2Players[2], score: 112),
                    .init(player: match2Players[3], score: 97),
                ]
            ),
        ]
        static let match2 = Match(
            id: UUID(),
            game: Games.uno,
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            players: match2Players,
            winScore: 400,
            rounds: match2Rounds,
            winner: match2Players[2]
        )
    }
}
