//
//  TextView.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

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
