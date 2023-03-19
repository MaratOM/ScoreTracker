//
//  AddButton.swift
//
//
//  Created by Marat Mikaelyan on 11.03.2023.
//

import SwiftUI

public struct AddButton<Content>: View where Content: View {
    private let color: Color
    private let action: () -> Void
    private let content: () -> Content
    
    private let defaultOpacity: Double = 1
    @State var backgroundOpacity: Double = 1
    
    public init(
        color: Color,
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.color = color
        self.action = action
        self.content = content
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(color)
                .opacity(backgroundOpacity)
            HStack {
                content()
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 14)
        }
        .fixedSize(horizontal: true, vertical: true)
        .gesture(
            LongPressGesture(minimumDuration: 0.00001)
                .onChanged { _ in
                    withAnimation {
                        backgroundOpacity = 0.4
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        action()
                        backgroundOpacity = defaultOpacity
                    }
                }
        )
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AddButton(color: .green, action: { },content: {
                Text("Add something")
            })
            
            AddButton(color: .blue) {
                
            } content: {
                Text("Send")
            }
        }
    }
}
