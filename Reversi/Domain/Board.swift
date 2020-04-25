//
//  Board.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Board {
    let width: UInt = 8
    let height: UInt = 8
    
    var cells: Set<Cell> = []

    init() {
        for y in 0 ..< height {
            for x in 0 ..< width {
                let disk: Disk?
                switch (x, y) {
                case (width / 2 - 1, height / 2 - 1),
                     (width / 2, height / 2):
                    disk = .light

                case (width / 2 - 1, height / 2),
                     (width / 2, height / 2 - 1):
                    disk = .dark

                default:
                    disk = nil
                }
                cells.insert(Cell(coordinate: Coordinate(x: x, y: y), disk: disk))
            }
        }
    }
}
