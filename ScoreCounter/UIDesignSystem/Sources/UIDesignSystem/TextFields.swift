//
//  TextFields.swift
//  
//
//  Created by Marat Mikaelyan on 15.09.2023.
//

import SwiftUI

public enum TextFields {
    case big(String, Binding<String>)
    case small(String, Binding<String>)
    
    var palette: ColorPalette { UIDesignSystemStore.palette }
    
    var fontSize: CGFloat {
        switch self {
        case .big:
            return 28
        case .small:
            return 17
        }
    }
    
    public var view: some View {
        switch self {
        case .big(let placeholder, let name):
            return TextFieldView(
                placeholder: placeholder,
                foregroundColor: palette.colors.fifth,
                backgroundColor: palette.colors.second,
                fontSize: self.fontSize,
                opacity: 0.7,
                name: name
            )
        case .small(let placeholder, let name):
            return TextFieldView(
                placeholder: placeholder,
                foregroundColor: palette.colors.fifth,
                backgroundColor: palette.colors.second,
                fontSize: self.fontSize,
                opacity: 0.7,
                name: name
            )
        }
    }
}
