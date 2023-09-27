//
//  BackgroundView.swift
//  
//
//  Created by Marat Mikaelyan on 27.09.2023.
//

import SwiftUI

struct BackgroundView: View {
    let palette: ColorPalette = UIDesignSystemStore.palette
    let colors: [Color]
    let points: (UnitPoint, UnitPoint)

    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: points.0,
            endPoint: points.1
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static let palette = UIDesignSystemStore.palette
    static var previews: some View {
        BackgroundView(
            colors: [palette.colors.first, palette.colors.second],
            points: (.topLeading, .bottomTrailing)
        )
    }
}
