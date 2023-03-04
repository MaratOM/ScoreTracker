//
//  SwiftUIView.swift
//
//  AddPlayerScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 04.03.2023.
//

import SwiftUI

struct AddPlayerScreen: View {
    @State private var isModal = false
    @State private var name = ""

    var body: some View {
        VStack {
            Button {
                isModal.toggle()
            } label: {
                Label("Add Avatar", systemImage: "person.badge.plus")
                    .labelStyle(.iconOnly)
                    .font(.system(size: 80))
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $isModal) {
                AvatarsListScreen()
            }
            
            HStack {
                TextField("Add Name", text: $name)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct AddPlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerScreen()
    }
}
