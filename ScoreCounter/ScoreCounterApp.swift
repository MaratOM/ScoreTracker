//
//  ScoreCounterApp.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

@main
struct ScoreCounterApp: App {
    @StateObject private var store = ScoreCounterStore()
    
    var body: some Scene {
        let colors = store.palette.colors
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(colors.fifth)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(colors.fifth)]
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(colors.fourth)

        return WindowGroup {
            ContentView()
                .accentColor(colors.fifth)
                .environmentObject(store)
        }
    }
}
