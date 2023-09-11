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
        case matches
        case games
        case players
        case statistics
    }
    
    var body: some View {
        TabView(selection: $store.tabSelection) {
            MatchesScreen()
                .tag(Tab.matches)
                .tabItem {
                    Image(systemName: "list.triangle")
                }
            GamesScreen()
                .tag(Tab.games)
                .tabItem {
                    Image(systemName: "gamecontroller")
                }
            PlayersScreen()
                .tag(Tab.players)
                .tabItem {
                    Image(systemName: "person")
                }
            StatisticsScreen()
                .tag(Tab.statistics)
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
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
