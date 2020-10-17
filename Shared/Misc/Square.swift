//
//  Square.swift
//  GameOfLife
//
//  Created by Chad Parker on 10/15/20.
//

import SwiftUI

/// A centered square in a rect
struct Square: Shape {

    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        let smallDimension = min(rect.width, rect.height)
                            // center it
        let square = CGRect(x: rect.origin.x + rect.width / 2 - smallDimension / 2,
                            y: rect.origin.y + rect.height / 2 - smallDimension / 2,
                            width: smallDimension,
                            height: smallDimension)
        var path = Path()
        path.addRoundedRect(in: square,
                            cornerSize: CGSize(width: cornerRadius, height: cornerRadius),
                            style: .continuous)
        return path
    }
}
