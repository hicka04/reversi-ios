//
//  Board.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Board {
    let size: (width: Int, height: Int) = (8, 8)
    lazy var range: (x: Range<Int>, y: Range<Int>) = (0 ..< size.width, 0 ..< size.height)
    
    var cells: Set<Cell> = []

    init() {
        for y in 0 ..< size.height {
            for x in 0 ..< size.width {
                let disk: Disk?
                switch (x, y) {
                case (size.width / 2 - 1, size.height / 2 - 1),
                     (size.width / 2, size.height / 2):
                    disk = .light

                case (size.width / 2 - 1, size.height / 2),
                     (size.width / 2, size.height / 2 - 1):
                    disk = .dark

                default:
                    disk = nil
                }
                cells.insert(Cell(coordinate: Coordinate(x: x, y: y), disk: disk))
            }
        }
    }
}
