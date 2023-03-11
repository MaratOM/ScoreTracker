//
//  GamesScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI
import UIKit

struct GamesScreen: View {
    @EnvironmentObject var store: ScoreCounterStore
    @State var pushActive = false
    @State var text = "Go to First Player"

    var body: some View {
        let games = store.games

        NavigationView {
            VStack {
                List(games) { game in
                    NavigationLink {
                        Text(game.name)
                            .font(.system(size: 40))
                    } label: {
                        Label(game.name, systemImage: game.type.imageName)
                    }
                }
                
                HStack {
                    UIKitLabel(text: $text)
                        .onTapGesture {
                            store.tabSelection = .players
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                pushActive.toggle()
                            }
                        }
                    AddItemView(linkView: AddGameScreen())
                }
                .padding(.leading, 20)
                .frame(width: nil, height: 70)
                
                NavigationLink(
                    destination: PlayerScreen(player: store.players[0]),
                    isActive: self.$pushActive
                ) {
                    EmptyView()
                }.hidden()
            }
            .navigationTitle("Games")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
            .environmentObject(ScoreCounterStore())
    }
}

struct UIKitLabel: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UILabel {
        UILabel()
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
