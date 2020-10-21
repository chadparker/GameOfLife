//
//  Extensions.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/19/20.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

// https://swiftbysundell.com/articles/building-swiftui-debugging-utilities/
extension View {

    func debugAction(_ closure: () -> Void) -> Self {
        #if DEBUG
        closure()
        #endif

        return self
    }

    func debugPrint(_ value: Any) -> Self {
        debugAction { print(value) }
    }
}
