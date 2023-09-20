//
//  AddRoundPlayer.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 28.08.2023.
//

import SwiftUI
import Combine
import UIDesignSystem

struct AddRoundPlayer: View {
    @EnvironmentObject var store: ScoreCounterStore
    @State var score = ""

    let player: Player
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.score
        }, set: {
            self.score = $0
            guard let score = Int(score) else { return }
            store.roundToAdd[player] = score
        })

        HStack {
            Text(player.avatar)
                .font(.system(size: 40))

            Texts.h3(player.name).view
                .padding(.trailing, 10)
            
            Spacer()

            TextFields.big("add score", binding).view
                .onReceive(Just(score)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.score = filtered
                    }
                }
                .keyboardType(.numberPad)
                .frame(width: 80)
        }
        .padding(0)
        .frame(height: 50)
    }
}

struct AddRoundPlayer_Previews: PreviewProvider {
    static let store = ScoreCounterStore()
    static var previews: some View {
        AddRoundPlayer(player: store.players[0])
    }
}
