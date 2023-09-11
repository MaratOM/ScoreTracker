//
//  ScoreCounterStore.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import Foundation
import UIDesignSystem

final class ScoreCounterStore: ObservableObject {
    @Published var tabSelection: ContentView.Tab = .games
    @Published var palette: ColorPalette {
        didSet {
            UIDesignSystemStore.palette = palette
        }
    }

    init() {        
        palette = .purple2
        UIDesignSystemStore.palette = palette
    }

    @Published var games: [Game] = [
        ScoreCounterData.Games.uno,
        ScoreCounterData.Games.domino,
        ScoreCounterData.Games.cards,
    ]
    
    @Published var players: [Player] = [
        ScoreCounterData.Players.me,
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

    @Published var chosenGameName = "Uno"
    @Published var chosenGameDefaultName = "Uno"
    @Published var chosenPlayers = [Player]()
    @Published var scoreToWin = 0
    
    @Published var roundToAdd: [Player: Int] = [:]
}
