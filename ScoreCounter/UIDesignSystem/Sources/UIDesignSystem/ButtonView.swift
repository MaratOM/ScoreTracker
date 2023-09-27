//
//  ButtonView.swift
//  
//
//  Created by Marat Mikaelyan on 27.09.2023.
//

import SwiftUI

struct ButtonView: View {
    let palette = UIDesignSystemStore.palette
    let action: () -> Void
    let title: String
    let disabled: Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Backgrounds.button.view
                Texts.h4(title).view
                    .frame(minWidth: 0, maxWidth: 100)
                    .padding(10)
                    .foregroundColor(palette.colors.fifth)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(palette.colors.fourth, lineWidth: 1))
            }
        }
        .disabled(disabled)
        .frame(width: 100, height: 26)
        .padding(10)
        .cornerRadius(8)
        .opacity(disabled ? 0.6 : 1.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: { }, title: "Button", disabled: false)
    }
}
