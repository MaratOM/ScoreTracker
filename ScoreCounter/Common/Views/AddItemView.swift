//
//  AddItemView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 08.03.2023.
//

import SwiftUI

struct AddItemView: View {
    var linkView: any View
    let iconSize: CGFloat = 50
    
    var body: some View {
        NavigationLink {
            AnyView(linkView)
        } label: {
            Label("text", systemImage: "plus.circle")
                .font(.system(size: iconSize))
                .foregroundColor(.blue)
                .labelStyle(.iconOnly)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(linkView: AddPlayerScreen())
    }
}
