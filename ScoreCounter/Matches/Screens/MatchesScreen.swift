//
//  MatchesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 26.08.2023.
//

import SwiftUI

struct MatchesScreen: View {
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        let matches = store.matches

        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(matches) { match in
                            NavigationLink {
                                MatchScreen(match: match)
                            } label: {
                                MatchCell(match: match)
                                Spacer()
                                Label("", systemImage: "chevron.right")
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .padding()
                }

                AddItemView(linkView: AddGameScreen())
            }
            .navigationTitle("Matches")
        }
    }
}

struct MatchesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesScreen()
            .environmentObject(ScoreCounterStore())
    }
}

