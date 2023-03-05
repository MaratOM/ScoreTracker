//
//  PlayerScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI

struct PlayerScreen: View {
    var player: Player

    var body: some View {
        VStack {
            Text(player.avatar)
                .font(.system(size: 140))
            Text(player.name)
                .font(.largeTitle)
                .foregroundColor(.black)
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
