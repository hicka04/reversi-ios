//
//  Player.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Player {
    enum Mode: Int {
        case manual = 0
        case auto = 1
    }
    
    var mode: Mode = .manual
    let disk: Disk
}
