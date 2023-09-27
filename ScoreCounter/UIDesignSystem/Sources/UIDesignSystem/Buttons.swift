//
//  Buttons.swift
//  
//
//  Created by Marat Mikaelyan on 27.09.2023.
//

import SwiftUI

public enum Buttons {
    case big(() -> Void, String, Bool)
    
    public var view: some View {
        switch self {
        case let .big(action, title, disabled):
            return ButtonView(action: action, title: title, disabled: disabled)
        }
    }
}
