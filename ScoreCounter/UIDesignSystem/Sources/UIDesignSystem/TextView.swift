//
//  TextView.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public enum Texts {
    case h1(String)
    case h2(String)
    case h3(String)
    case h4(String)
    case h4WithOpacity(String)
    case h5(String)
    case paragraph(String)
    
    var palette: ColorPalette { UIDesignSystemStore.palette }
    
    var size: CGFloat {
        switch self {
        case .h1:
            return 32
        case .h2:
            return 28
        case .h3:
            return 24
        case .h4, .h4WithOpacity:
            return 20
        case .h5:
            return 16
        case .paragraph:
            return 12
        }
    }
    
    var color: Color {
        switch self {
        default:
            return palette.colors.fifth
        }
    }
    
    public var view: some View {
        switch self {
        case .h2(let text):
            return TextView(text: text, size: self.size, color: self.color)
        case .h1(let text):
            return TextView(text: text, size: self.size, color: self.color)
        case .h3(let text):
            return TextView(text: text, size: self.size, color: self.color)
        case .h4(let text):
            return TextView(text: text, size: self.size, color: self.color)
        case .h4WithOpacity(let text):
            return TextView(text: text, size: self.size, color: self.color, opacity: 0.7)
        case .h5(let text):
            return TextView(text: text, size: self.size, color: self.color)
        case .paragraph(let text):
            return TextView(text: text, size: self.size, color: self.color)
        }
    }
}

struct TextView: View {
    var text: String
    var size: CGFloat
    var color: Color
    var opacity: Double
    
    internal init(text: String, size: CGFloat, color: Color, opacity: Double = 1.0) {
        self.text = text
        self.size = size
        self.color = color
        self.opacity = opacity
    }

    var body: some View {
        Text(text)
            .font(.system(size: size))
            .foregroundColor(color)
            .opacity(opacity)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Sample text", size: 12, color: .gray)
    }
}
