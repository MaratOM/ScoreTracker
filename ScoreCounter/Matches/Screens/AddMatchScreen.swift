//
//  AddMatchScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 29.08.2023.
//

import SwiftUI
import Combine

struct AddMatchScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    @State private var isModalGames = false
    @State private var isModalPlayers = false
    @State var score = ""

    var body: some View {
        let binding = Binding<String>(get: {
            score
        }, set: {
            score = $0
            guard let score = Int(score) else { return }
            store.scoreToWin = score
        })
        
        return VStack(spacing: 6) {
            HStack {
                Text("Game:")
                    .bold()
                Text("\(store.chosenGameName)")
                Spacer()
                Button {
                    isModalGames.toggle()
                } label: {
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 24))
                }
                .sheet(isPresented: $isModalGames) {
                    if #available(iOS 16.0, *) {
                        ChooseGameScreen()
                            .presentationDetents([.medium])
                    } else {
                        ChooseGameScreen()
                    }
                }
            }
            
            HStack {
                HStack() {
                    Text("Players:")
                        .bold()
                    if store.chosenPlayers.isEmpty {
                        Text("add players")
                            .foregroundColor(.gray)
                            .opacity(0.6)
                    } else {
                        ForEach(store.chosenPlayers, id: \.id) { player in
                            NavigationLink {
                                PlayerScreen(player: player)
                            } label: {
                                Text(player.name)
                            }
                        }
                        if store.chosenPlayers.count == 1 {
                            Text("add more players")
                                .foregroundColor(.red)
                                .opacity(0.6)
                        }
                    }

                    Spacer()
                }
 
                Button {
                    isModalPlayers.toggle()
                } label: {
                    Image(systemName: store.chosenPlayers.isEmpty ? "plus.circle" : "pencil.circle")
                        .font(.system(size: 24))
                }
                .sheet(isPresented: $isModalPlayers) {
                    if #available(iOS 16.0, *) {
                        ChoosePlayerScreen()
                            .presentationDetents([.medium])
                    } else {
                        ChoosePlayerScreen()
                    }
                }
            }
            
            HStack {
                Text("Score to win:")
                    .bold()
                TextField("enter score", text: binding)
                    .onReceive(Just(score)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.score = filtered
                        }
                    }
                    .font(.system(size: 20))
                    .keyboardType(.numberPad)
            }
            
            Spacer()
            
            if store.chosenPlayers.count > 1, store.scoreToWin > 0 {
                Button {
                    store.matches.append(
                        .init(
                            id: UUID(),
                            game: store.games.first(where: { $0.name == store.chosenGameName}) ?? store.games[0],
                            date: Date(),
                            players: store.chosenPlayers,
                            winScore: store.scoreToWin,
                            rounds: []
                        )
                    )
                    store.chosenPlayers = []
                    store.scoreToWin = 0
                    store.chosenGameName = store.chosenGameDefaultName
                    score = ""
                    dismiss()
                } label: {
                    Label("text", systemImage: "plus.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                        .labelStyle(.iconOnly)
                }
            }
        }
        .navigationTitle("Add match")
        .padding()
    }
}

struct AddMatchScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMatchScreen()
            .environmentObject(ScoreCounterStore())
    }
}