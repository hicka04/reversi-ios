//
//  Cell.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Cell: Hashable {
    let coordinate: Coordinate
    var disk: Disk?
}

extension Cell: Comparable {
    static func < (lhs: Cell, rhs: Cell) -> Bool {
        if lhs.coordinate.y < rhs.coordinate.y {
            return true
        } else if lhs.coordinate.y == rhs.coordinate.y && lhs.coordinate.x < rhs.coordinate.x {
            return true
        } else {
            return false
        }
    }
}
