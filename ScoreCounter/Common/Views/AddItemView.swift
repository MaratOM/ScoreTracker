//
//  AddItemView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 08.03.2023.
//

import SwiftUI

struct AddItemView: View {
    var linkView: any View
    
    var body: some View {
        NavigationLink {
            AnyView(linkView)
        } label: {
            HStack {
                Spacer()
                Label("text", systemImage: "plus.circle")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .labelStyle(.iconOnly)
                    .padding([.trailing], 30)
                    .padding([.bottom], 20)

            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(linkView: AddPlayerScreen())
    }
}
