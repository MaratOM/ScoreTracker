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
    @EnvironmentObject var scoreCounterData: ScoreCounterData
    @State private var isModal = false
    @State private var name = ""

    var body: some View {
        let avatar = scoreCounterData.chosenAvatar

        
        VStack {
            Button {
                isModal.toggle()
            } label: {
                Text(avatar != "" ? avatar : "☺︎")
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
                    } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        if scoreCounterData.chosenAvatar != "",
                           name != "" {
                            scoreCounterData.players.append(
                                Player(
                                    id: UUID().uuidString,
                                    name: name,
                                    avatar: scoreCounterData.chosenAvatar
                                )
                            )
                            
                            dismiss()
                            scoreCounterData.chosenAvatar = ""
                            name = ""
                        }
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, -30)
            }
        }
    }
}

struct AddPlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerScreen()
            .environmentObject(ScoreCounterData())
    }
}
