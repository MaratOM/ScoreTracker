//
//  AddRoundScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import SwiftUI
import UIDesignSystem

struct AddRoundScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    var match: Match

    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
        
        func getLeader(index: Int) -> Score? {
            let scores: [Score] = store.matches[index].players.map { .init(player: $0, score: playerScore(index: index, player: $0))}
            var leader: Player?
            var maxScore = 0

            for score in scores {
                if score.score > maxScore {
                    maxScore = score.score
                    leader = score.player
                }
            }
            
            return scores.first(where: { $0.player == leader })
        }
        
        func playerScore(index: Int, player: Player) -> Int {
            var num = 0
            
            for round in store.matches[index].rounds {
                for score in round.scores {
                    if score.player == player {
                        num += score.score
                    }
                }
            }
            
            return num
        }

        return ZStack {
            Backgrounds.main.view
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        store.roundToAdd = [:]
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 30))
                            .padding(.trailing, 20)
                            .padding([.top, .bottom], 5)
                            .foregroundColor(store.palette.colors.fourth)
                    }
                }

                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(match.players, id: \.id) { player in
                                AddRoundPlayer(player: player)
                                    .padding(0)

                            }
                        }
                        .padding(.horizontal, 40)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button {
                        store.roundToAdd = [:]
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        if let index = store.matches.firstIndex(where: { $0 == match}) {
                            var scores: [Score] = []

                            for (player, score) in store.roundToAdd {
                                scores.append(.init(player: player, score: score))
                            }
                            
                            scores.sort(by: { score1, score2 in
                                let player1Index = match.players.firstIndex(where: { $0 == score1.player}) ?? 0
                                let player2Index = match.players.firstIndex(where: { $0 == score2.player}) ?? 0
                                return player1Index < player2Index
                            })
                                                    
                            store.matches[index].rounds.append(.init(scores: scores))
                            store.roundToAdd = [:]
                            
                            if let leader = getLeader(index: index), leader.score >= match.winScore {
                                store.matches[index].winner = leader.player
                            }
                        }
                        dismiss()
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(store.roundToAdd.count != match.players.count)
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct AddRoundScreen_Previews: PreviewProvider {
    static let store = ScoreCounterStore()
    static var previews: some View {
        AddRoundScreen(match: store.matches[1])
            .environmentObject(store)
    }
}
