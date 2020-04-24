//
//  Player.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Player {
    enum Mode {
        case manual
        case auto
    }
    
    var mode: Mode = .manual
    let disk: Disk
}
