//
//  PlayersScoresRow.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 03.09.2023.
//

import SwiftUI

struct PlayersScoresRow<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        HStack {
            Spacer()
            content
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .fixedSize(horizontal: true, vertical: false)
        .frame(maxWidth: .infinity)
    }
}
