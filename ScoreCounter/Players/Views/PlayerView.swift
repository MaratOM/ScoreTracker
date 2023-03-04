//
//  PlayerView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI

struct PlayerView: View {
    var player: Player
    var body: some View {
        VStack {
            Text(player.avatar)
                .font(.system(size: 70))
            Text(player.name)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let scoreCounterData = ScoreCounterData()
    
    static var previews: some View {
        PlayerView(
            player: scoreCounterData.players[0]
        )
    }
}
