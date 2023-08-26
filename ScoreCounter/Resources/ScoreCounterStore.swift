//
//  ScoreCounterStore.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import Foundation

final class ScoreCounterStore: ObservableObject {
    @Published var tabSelection: ContentView.Tab = .matches

    @Published var games: [Game] = [
        ScoreCounterData.Games.uno,
        ScoreCounterData.Games.domino,
        ScoreCounterData.Games.chess,
    ]
    
    @Published var players: [Player] = [
        ScoreCounterData.Players.john,
        ScoreCounterData.Players.paul,
        ScoreCounterData.Players.george,
        ScoreCounterData.Players.ringo,
    ]
    
    
    @Published var matches: [Match] = [
        ScoreCounterData.Matches.match1,
        ScoreCounterData.Matches.match2,
    ]
    
    @Published var chosenAvatar = ""
}
