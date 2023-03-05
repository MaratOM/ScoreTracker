//
//  SwiftUIView.swift
//
//  AddPlayerScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI

struct AddPlayerScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ScoreCounterStore
    @State private var isModal = false
    @State private var name = ""
    
    func clearData() {
        store.chosenAvatar = ""
        name = ""
    }

    var body: some View {
        let avatar = store.chosenAvatar
        
        VStack {
            Button {
                isModal.toggle()
            } label: {
                Text(avatar != "" ? avatar : "🫥")
                    .font(.system(size: 120))
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $isModal) {
                AvatarsListScreen()
            }
            
            TextField("Add Name", text: $name)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top, -70)
            
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
                        if store.chosenAvatar != "",
                           name != "" {
                            store.players.append(
                                Player(
                                    name: name,
                                    avatar: store.chosenAvatar
                                )
                            )
                            
                            dismiss()
                            clearData()
                        }
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(store.chosenAvatar == "" || name == "")
                }
                .padding(.top, -30)
            }
        }
    }
}

struct AddPlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerScreen()
            .environmentObject(ScoreCounterStore())
    }
}
