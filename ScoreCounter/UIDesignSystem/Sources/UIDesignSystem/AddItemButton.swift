//
//  AddItemButton.swift
//  
//
//  Created by Marat Mikaelyan on 11.09.2023.
//

import SwiftUI

public struct AddItemButton: View {
    var linkView: any View
    
    public init(linkView: any View) {
        self.linkView = linkView
    }
    
    public var body: some View {
        NavigationLink {
            AnyView(linkView)
        } label: {
            AddItemButtonLabel()
        }
    }
}

struct AddItemButton_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButton(linkView: Text("Some Screen"))
    }
}
