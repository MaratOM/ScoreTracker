//
//  AddItemButtonLabel.swift
//  
//
//  Created by Marat Mikaelyan on 12.09.2023.
//

import SwiftUI

public struct AddItemButtonLabel: View {
    let palette: ColorPalette = UIDesignSystemStore.palette
    let iconSize: CGFloat = 50
    
    public init() { }

    public var body: some View {
        Image(systemName: "plus.circle")
            .font(.system(size: iconSize))
            .foregroundColor(palette.colors.fifth)
    }
}

struct AddItemButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButtonLabel()
    }
}
