//
//  MatchScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import SwiftUI

struct MatchScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    @State private var isModal = false
    @State private var editWinScore = false

    let chosenMatch: Match

    var body: some View {
        let index = store.matches.firstIndex(where: { $0 == chosenMatch }) ?? 0
        let match = store.matches[index]
        var playersScores: [Int] {
            match.players.map { playerScore(player: $0) }
        }
        var gameStatus: some View {
            var foregroundColor = Color.green
            var angleDegrees = 180
            
            if match.winner != nil {
                foregroundColor = Color.red
                angleDegrees = 0
            }

            return Image(systemName: "hourglass.bottomhalf.filled")
                .font(.system(size: 20))
                .foregroundColor(foregroundColor)
                .rotationEffect(.init(degrees: Double(angleDegrees)))
        }
        var allScores: [Int] {
            var scores: [Int] = []
            for round in match.rounds {
                for score in round.scores {
                    scores.append(score.score)
                }
            }
            return scores
        }
        
        func getDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm dd.MM.yy"
            return dateFormatter.string(from: match.date)
        }
        
        func getDuration() -> String {
            var dateTo = Date()

            if let endDate = store.matches[index].endDate {
                dateTo = endDate
            }
            
            let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: store.matches[index].date, to: dateTo)
            let hours = diffComponents.hour
            let minutes = diffComponents.minute
            var duration = ""
            if let hours = hours, let minutes = minutes {
                if hours > 24 {
                    duration = "> day"
                } else if hours == 0 {
                    if minutes == 0 {
                        duration = "< minute"
                    } else {
                        duration = "\(minutes)m"
                    }
                } else {
                    duration = "\(hours)h \(minutes)m"
                }
            }

            return duration
        }
        
        func playerScore(player: Player) -> Int {
            var num = 0
            
            for round in match.rounds {
                for score in round.scores {
                    if score.player == player {
                        num += score.score
                    }
                }
            }
            
            return num
        }
        
        func getPlayerPlace(index: Int) -> Int {
            (playersScores
                .sorted()
                .reversed()
                .firstIndex { $0 == playersScores[index] } ?? 0
            ) + 1
        }
        
        func getPlayersPlaceImage(place: Int) -> some View {
            var systemImage = ""
            var foregroundColor = Color.green

            if place == 1 {
                systemImage = "crown.fill"
                foregroundColor = .yellow
            } else {
                systemImage = "\(place).circle"
            }

            return Image(systemName: systemImage)
                .foregroundColor(foregroundColor)
                .font(.system(size: 24))
        }
        
        func getRounds() -> some View {
            let columns: [GridItem] = Array(repeating: .init(.flexible()), count: match.players.count)
            
            return ScrollView {
                VStack {
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(match.players) { player in
                            Text("\(player.avatar)")
                                .font(.system(size: 34))
                        }
                    }
                    .padding(.top, 6)
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(match.players) { player in
                            Text("\(player.name)")
                        }
                    }
                    .padding(.top, -10)
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(match.players.indices, id: \.self) { index in
                            getPlayersPlaceImage(place: getPlayerPlace(index: index))
                        }
                    }
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(match.players.indices, id: \.self) { index in
                            Text("\(playersScores[index])")
                                .id("\(playersScores[index])-\(index)")
                                .font(Font.headline.weight(.bold))
                        }
                    }
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(allScores.indices, id: \.self) { index in
                            Text("\(allScores[index])")
                        }
                    }
                    .padding(.top, 8)
                }
                .padding(.top, 0)
            }
        }
        
        return VStack(spacing: 6){
            HStack() {
                Text("Game:")
                    .bold()
                Text("\(match.game.name)")
                Spacer()
                gameStatus
            }
            HStack() {
                Text("Start time:")
                    .bold()
                Text("\(getDate())")
                Spacer()
                Label(getDuration(), systemImage: "clock")
                    .foregroundColor(.green)
            }
            HStack() {
                Text("Winning score:")
                    .bold()
                Text("\(store.matches[index].winScore)")
                Spacer()
                if match.winner == nil {
                    if !editWinScore {
                        Button {
                            editWinScore.toggle()
                        } label: {
                            Image(systemName: "pencil.circle")
                                .font(.system(size: 24))
                        }
                    } else {
                        let step = store.matches[index].winScore > 99 ? 10 : 1
                        Stepper(
                            "",
                            value: $store.matches[index].winScore,
                            in: (playersScores.max() ?? 0)...100000,
                            step: step
                        )
                        .frame(height: 20)
                        
                        Button {
                            editWinScore.toggle()
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            HStack() {
                Text("Players:")
                    .bold()
                ForEach(match.players, id: \.id) { player in
                    NavigationLink {
                        PlayerScreen(player: player)
                    } label: {
                        Text(player.name)
                    }
                }
                Spacer()
            }
            HStack {
                if let winner = match.winner {
                    Text("Winner:")
                        .bold()
                    NavigationLink {
                        PlayerScreen(player: winner)
                    } label: {
                        Text("\(winner.name)")
                    }
                    Spacer()
                }
            }
            HStack() {
                getRounds()
                Spacer()
            }
            .padding(.top, 12)
            
            Spacer()
            
            if match.winner == nil {
                Button {
                    isModal.toggle()
                } label: {
                    Label("text", systemImage: "plus.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                        .labelStyle(.iconOnly)
                }
                .sheet(isPresented: $isModal) {
                    if #available(iOS 16.0, *) {
                        AddRoundScreen(match: match)
                            .presentationDetents([.medium])
                    } else {
                        AddRoundScreen(match: match)
                    }
                }
            }
        }
        .navigationTitle("Match")
        .padding()
    }
}

struct MatchScreen_Previews: PreviewProvider {
    static let store = ScoreCounterStore()    
    static var previews: some View {
        MatchScreen(chosenMatch: store.matches[0])
            .environmentObject(store)
    }
}
