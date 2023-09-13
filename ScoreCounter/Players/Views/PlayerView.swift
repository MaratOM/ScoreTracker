//
//  PlayerView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI
import UIDesignSystem

struct PlayerView: View {
    var player: Player
    var body: some View {
        VStack {
            Text(player.avatar)
                .font(.system(size: 70))
            Texts.h4(player.name).view
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let store = ScoreCounterStore()
    
    static var previews: some View {
        PlayerView(
            player: store.players[0]
        )
    }
}
