//
//  SwiftUIView.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public struct BackgroundMain: View {
    let palette: ColorPalette = UIDesignSystemStore.palette
    
    public init() { }

    public var body: some View {
        LinearGradient(
            colors: [
                palette.colors.first,
                palette.colors.second,
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundMain_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMain()
    }
}
