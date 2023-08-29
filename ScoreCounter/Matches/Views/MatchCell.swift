//
//  MatchCell.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import SwiftUI

struct MatchCell: View {
    @EnvironmentObject var store: ScoreCounterStore
    let chosenMatch: Match

    var body: some View {
        let index = store.matches.firstIndex(where: { $0 == chosenMatch }) ?? 0
        let match = store.matches[index]
        
        func getDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: match.date)
        }
        
        func myPlace(match: Match) -> Int {
            (match.players.firstIndex { $0.name == "Me" } ?? 1) + 1
        }

        return VStack {
            HStack {
                Text(match.game.name)
                Spacer()
                Text(getDate())
            }
            HStack {
                Text("Players: \(match.players.count)")
                Spacer()
            }
            HStack {
                if let winner = match.winner {
                    Text("Winner: \(winner.name)")
                    Spacer()
                }
            }
            HStack {
                Text("My place: \(myPlace(match: match))")
                Spacer()
                Label("", systemImage:
                      match.winner != nil
                      ? "clock.badge.checkmark"
                      : "clock"
                )
                .foregroundColor(match.winner != nil ? .red : .green)
            }
        }
    }
}

struct MatchCell_Previews: PreviewProvider {
    static let store = ScoreCounterStore()

    static var previews: some View {
        MatchCell(chosenMatch: store.matches[1])
    }
}
