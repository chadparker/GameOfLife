//
//  Modifiers.swift
//  GameOfLife
//
//  Created by Chad Parker on 11/9/20.
//

import SwiftUI

// MARK: - Text extensions

extension Text {
    
    func buttonText() -> Text {
        self
            .font(.callout)
            .fontWeight(.heavy)
    }
}
