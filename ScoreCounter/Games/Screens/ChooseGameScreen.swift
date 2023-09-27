//
//  ChooseGameScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 29.08.2023.
//

import SwiftUI
import UIDesignSystem

struct ChooseGameScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
        
        ZStack {
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
                        ForEach(store.games) { game in
                            Button {
                                store.chosenGameName = game.name
                                dismiss()
                            } label: {
                                Label(game.name, systemImage: game.type.imageName)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 10)
                                
                                Spacer()
                                
                                if store.chosenGameName == game.name {
                                    Image(systemName: "checkmark.circle")
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                }
            }
        }
        .accentColor(store.palette.colors.fifth)
    }
}

struct ChooseGameScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseGameScreen()
            .environmentObject(ScoreCounterStore())
    }
}

