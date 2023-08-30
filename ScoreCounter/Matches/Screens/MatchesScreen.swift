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
        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
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
                    }
                    .padding()
                }

                AddItemView(linkView: AddMatchScreen())
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

