//
//  Backgrounds.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public enum Backgrounds {
    case main
    case button
    
    var palette: ColorPalette { UIDesignSystemStore.palette }
    
    var colors: [Color] {
        switch self {
        case .main:
            return [
                palette.colors.first,
                palette.colors.second,
            ]
        case .button:
            return [
                palette.colors.first,
                palette.colors.second,
            ]
        }
    }
    
    var points: (UnitPoint, UnitPoint) {
        switch self {
        case .main:
            return (.topLeading, .bottomTrailing)
        case .button:
            return (.top, .bottom)
        }
    }

    public var view: some View {
        BackgroundView(colors: colors, points: points)
    }
}
