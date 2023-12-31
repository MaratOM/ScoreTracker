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
        static let format = ISO8601DateFormatter()
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
            game: Games.uno,
            date: format.date(from: "2023-08-25T13:31:46+0000")!,
            endDate: nil,
            players: match1Players,
            winScore: 200,
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
        static let date = format.date(from: "2023-08-20T19:25:46+0000")!
        static let endDate = format.date(from: "2023-08-20T20:41:46+0000")!
        static let match2 = Match(
            game: Games.uno,
            date: date,
            endDate: endDate,
            players: match2Players,
            winScore: 400,
            rounds: match2Rounds,
            winner: match2Players[2]
        )
    }
}
