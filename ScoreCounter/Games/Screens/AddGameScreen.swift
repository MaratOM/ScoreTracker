//
//  AddGameScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 08.03.2023.
//

import SwiftUI
import UIDesignSystem

struct AddGameScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    @State private var type: GameType = .down
    @State private var name = ""
    
    func clearData() {
        type = .down
        name = ""
    }

    var body: some View {
        ZStack {
            BackgroundMain()

            VStack {
                Picker(selection: $type) {
                    ForEach(GameType.allCases, id: \.self) {
                        Image(systemName: $0.imageName).tag($0)
                    }
                } label: {
                    Text("Picker Name")
                }
                .pickerStyle(.segmented)
                
                Texts.h4("\(type.description)").view
                
                TextFields.big("Game name", $name).view
                    .frame(width: 200)
                
                HStack {
                    Buttons.big({
                        dismiss()
                        clearData()
                    }, "Cancel", false).view
                    
                    Buttons.big({
                        if name != "" {
                            store.games.append(
                                Game(
                                    name: name,
                                    type: type
                                )
                            )
                            
                            dismiss()
                            clearData()
                        }
                    }, "Add", name == "").view
                }
                .padding(.top, 8)

            }
            .navigationTitle("Add Game")
        }
    }
}

struct AddGameScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddGameScreen()
            .environmentObject(ScoreCounterStore())
    }
}
