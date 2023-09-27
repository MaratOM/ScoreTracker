//
//  ChoosePlayerScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 29.08.2023.
//

import SwiftUI
import UIDesignSystem

struct ChoosePlayerScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
        
        return ZStack {
            Backgrounds.main.view
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 30))
                            .padding(.trailing, 20)
                            .padding([.top, .bottom], 5)
                            .foregroundColor(store.palette.colors.fourth)
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(store.players) { player in
                            Button {
                                if store.chosenPlayers.contains(player) {
                                    store.chosenPlayers = store.chosenPlayers.filter { $0 != player }
                                } else {
                                    store.chosenPlayers.append(player)
                                }
                            } label: {
                                Text(player.avatar)
                                    .font(.system(size: 30))
                                    .padding(.bottom, 10)
                                
                                Text(player.name)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 10)
                                
                                Spacer()
                                
                                Image(systemName: store.chosenPlayers.contains(player) ? "minus.circle" : "plus.circle")
                                    .font(.system(size: 30))
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    
                    Spacer()
     
                    Button {
                        dismiss()
                    } label: {
                        Text("Finish")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .accentColor(store.palette.colors.fifth)
        }
    }
}

struct ChoosePlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlayerScreen()
            .environmentObject(ScoreCounterStore())
    }
}
