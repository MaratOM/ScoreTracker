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

                TextField("", text: $name)
                    .placeholder(when: name.isEmpty, alignment: .center) {
                        Texts.h4WithOpacity("Game name").view
                            .opacity(0.7)
                    }
                    .font(.title)
                    .foregroundColor(store.palette.colors.fifth)
                    .background(store.palette.colors.second)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                
                HStack {
                    Button {
                        dismiss()
                        clearData()
                    } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
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
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name == "")
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
