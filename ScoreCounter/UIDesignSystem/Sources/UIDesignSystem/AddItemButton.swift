//
//  AddItemButton.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public struct AddItemButton: View {
    var linkView: any View
    let iconSize: CGFloat = 50
    let palette: ColorPalette = UIDesignSystemStore.palette
    
    public init(linkView: any View) {
        self.linkView = linkView
    }
    
    public var body: some View {
        NavigationLink {
            AnyView(linkView)
        } label: {
            Label("text", systemImage: "plus.circle")
                .font(.system(size: iconSize))
                .foregroundColor(palette.colors.fifth)
                .labelStyle(.iconOnly)
        }
    }
}

struct AddItemButton_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButton(linkView: Text("Some Screen"))
    }
}
