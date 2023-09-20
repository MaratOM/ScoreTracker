//
//  TextFieldView.swift
//  
//
//  Created by Marat Mikaelyan on 19.09.2023.
//

import SwiftUI

struct TextFieldView: View {
    var placeholder: String
    var foregroundColor: Color
    var backgroundColor: Color
    var fontSize: CGFloat
    var opacity: Double
    @Binding var name: String

    var body: some View {
        TextField("", text: $name)
            .placeholder(when: name.isEmpty, alignment: .center) {
                Texts.h4WithOpacity(placeholder).view
                    .opacity(opacity)
            }
            .font(.system(size: fontSize))
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var name: String = ""
    static let palette: ColorPalette = UIDesignSystemStore.palette

    static var previews: some View {
        TextFieldView(
            placeholder: "Add name",
            foregroundColor: palette.colors.fifth,
            backgroundColor: palette.colors.second,
            fontSize: 28,
            opacity: 0.7,
            name: $name
        )
    }
}

