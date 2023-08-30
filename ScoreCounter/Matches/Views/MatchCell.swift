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
            dateFormatter.dateFormat = "dd.MM.yy"
            return dateFormatter.string(from: match.date)
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
                    Image(systemName: "crown.fill")
                        .foregroundColor(.yellow)
                    Spacer()
                }
            }
            HStack {
                Text("Winning score: \(match.winScore)")
                Spacer()
                Image(systemName:
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
