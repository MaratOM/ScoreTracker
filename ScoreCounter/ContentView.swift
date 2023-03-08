//
//  ContentView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ScoreCounterStore
    
    enum Tab {
        case games
        case players
    }
    
    var body: some View {
        TabView(selection: $store.tabSelection) {
            GamesScreen()
                .tag(Tab.games)
                .tabItem {
                    Label("Games", systemImage: "gamecontroller")
                }
            PlayersScreen()
                .tag(Tab.players)
                .tabItem {
                    Label("Players", systemImage: "person")
                }            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScoreCounterStore())
    }
}
