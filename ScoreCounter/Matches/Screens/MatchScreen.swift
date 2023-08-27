//
//  MatchScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 27.08.2023.
//

import SwiftUI

struct MatchScreen: View {
    let match: Match
    var playersScores: [Int] {
        match.players.map { playerScore(player: $0) }
    }
    var gameStatus: some View {
        var status = "active"
        var foregroundColor = Color.green
        var systemImage = "clock"
        
        if match.winner != nil {
            status = "closed"
            foregroundColor = Color.red
            systemImage = "clock.badge.checkmark"
        }

        return Label(status, systemImage: systemImage)
            .foregroundColor(foregroundColor)
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: match.date)
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

        return Label("", systemImage: systemImage)
            .foregroundColor(foregroundColor)
    }
    
    func getRounds() -> some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: match.players.count)
        
        return ScrollView {
            VStack {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(match.players) { player in
                        Text("\(player.avatar)")
                    }
                }
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(match.players) { player in
                        Text("\(player.name)")
                    }
                }
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(match.players.indices, id: \.self) { index in
                        getPlayersPlaceImage(place: getPlayerPlace(index: index))
                    }
                }
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(match.players.indices, id: \.self) { index in
                        Text("\(playersScores[index])")
                            .bold()
                    }
                }
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(match.rounds) { round in
                        ForEach(round.scores) { score in
                            Text("\(score.score)")
                        }
                    }
                }
                .padding(.top, 6)
            }
            .padding(.top, 0)
        }
    }

    var body: some View {
        VStack(spacing: 6){
            HStack() {
                Text("Game:")
                    .bold()
                Text("\(match.game.name)")
                Spacer()
                gameStatus
            }
            HStack() {
                Text("Date:")
                    .bold()
                Text("\(getDate())")
                Spacer()
            }
            HStack() {
                Text("Score to win:")
                    .bold()
                Text("\(match.winScore)")
                Spacer()
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
            
            AddItemView(linkView: AddGameScreen())
        }
        .navigationTitle("Match")
        .padding()
    }
}

struct MatchScreen_Previews: PreviewProvider {
    static let store = ScoreCounterStore()
    
    static var previews: some View {
        MatchScreen(match: store.matches[1])
    }
}
