//
//  PlayersScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 03.03.2023.
//

import SwiftUI
import UIDesignSystem

struct PlayersScreen: View {
    @EnvironmentObject var store: ScoreCounterStore
    
    var body: some View {
        let players = store.players

        NavigationView {
            ZStack {
                Backgrounds.main.view
                
                VStack {
                    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(players) { player in
                                NavigationLink {
                                    PlayerScreen(player: player)
                                } label: {
                                    PlayerView(player: player)
                                }
                            }
                        }
                    }
                    
                    AddItemButton(linkView: AddPlayerScreen())
                }
                .navigationTitle("Players")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PlayersScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayersScreen()
            .environmentObject(ScoreCounterStore())
    }
}
