//
//  Constants.swift
//  GameOfLife
//
//  Created by Chad Parker on 3/25/21.
//

import Foundation

struct Constants {
    
    struct BoardSize {
        static let min = 5
        static let initial = 20
        static let max = 50
    }
    
    struct Speed {
        static let initial = 0.25
        static let multiplier = 1.5
    }
}
