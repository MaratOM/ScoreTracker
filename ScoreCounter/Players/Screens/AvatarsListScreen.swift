//
//  AvatarsListScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI

struct AvatarsListScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)

        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 30))
                        .padding(.trailing, 20)
                        .padding([.top, .bottom], 5)
                        .foregroundColor(.black)
                }
            }

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0x1f600...0x1f645, id: \.self) { value in
                        Text(emoji(value))
                            .font(.system(size: 70))
                    }
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct AvatarsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AvatarsListScreen()
    }
}
