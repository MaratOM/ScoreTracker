//
//  MatchCell.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import SwiftUI

struct MatchCell: View {
    let match: Match

    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: match.date)
    }
    
    func myPlace(match: Match) -> Int {
        (match.players.firstIndex { $0.name == "Me" } ?? 1) + 1
    }

    var body: some View {
        VStack {
            HStack {
                Text(match.game.name)
                Spacer()
                Text(getDate())
            }
            HStack {
                Text("Players: \(match.players.count)")
                Spacer()
                Text("My place: \(myPlace(match: match))")
                Spacer()
                Label("", systemImage:
                      match.winner != nil
                      ? "clock.badge.checkmark"
                      : "clock"
                )
            }
        }
    }
}

struct MatchCell_Previews: PreviewProvider {
    static let store = ScoreCounterStore()

    static var previews: some View {
        MatchCell(match: store.matches[0])
    }
}
