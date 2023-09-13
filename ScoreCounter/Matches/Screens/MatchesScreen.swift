//
//  MatchesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 26.08.2023.
//

import SwiftUI
import UIDesignSystem

struct MatchesScreen: View {
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundMain()

                VStack {
                    ScrollView {
                        ForEach(store.matches) { match in
                            NavigationLink {
                                MatchScreen(chosenMatch: match)
                            } label: {
                                MatchCell(chosenMatch: match)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.bottom, 10)
                        }
                        .padding()
                    }
                    
                    AddItemButton(linkView: AddMatchScreen())
                }
                .navigationTitle("Matches")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct MatchesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesScreen()
            .environmentObject(ScoreCounterStore())
    }
}

