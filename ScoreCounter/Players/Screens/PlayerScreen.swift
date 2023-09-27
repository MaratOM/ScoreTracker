//
//  PlayerScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI
import UIDesignSystem

struct PlayerScreen: View {
    var player: Player

    var body: some View {
        ZStack {
            Backgrounds.main.view
            
            VStack {
                Text(player.avatar)
                    .font(.system(size: 140))
                Texts.h1(player.name).view
            }
        }
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static let store = ScoreCounterStore()
    
    static var previews: some View {
        PlayerScreen(
            player: store.players[0]
        )
    }
}
