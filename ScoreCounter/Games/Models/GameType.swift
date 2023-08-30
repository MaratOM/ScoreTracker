//
//  GameType.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

enum GameType: CaseIterable {
    case up
    case down
//    case single
    
    var imageName: String {
        switch self {
        case .up:
            return "arrow.up.square"
        case .down:
            return "arrow.down.square"
//        case .single:
//            return "scope"
        }
    }
    
    var description: String {
        switch self {
        case .up:
            return "max wins"
        case .down:
            return "min wins"
//        case .single:
//            return "one game - one point"
        }
    }
}
