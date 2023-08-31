//
//  AddGameScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 08.03.2023.
//

import SwiftUI

struct AddGameScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    @State private var type: GameType = .up
    @State private var name = ""
    
    func clearData() {
        type = .up
        name = ""
    }

    var body: some View {
        VStack {
//            Picker(selection: $type) {
//                ForEach(GameType.allCases, id: \.self) {
//                    Image(systemName: $0.imageName).tag($0)    
//                }
//            } label: {
//                Text("Picker Name")
//            }
//            .pickerStyle(.segmented)
            
            Text("\(type.description)")
            
            TextField("Add Game", text: $name)
                .font(.title)
                .multilineTextAlignment(.center)
            
            VStack {
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
            }
        }
        .navigationTitle("Add Game")
    }
}

struct AddGameScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddGameScreen()
            .environmentObject(ScoreCounterStore())
    }
}

