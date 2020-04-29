//
//  Game.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

struct Game {
    var board = Board()
    var players = [Player(disk: .dark), Player(disk: .light)]
    var turn: Disk? = .dark
    
    mutating func updatePlayerMode(_ mode: Player.Mode, of disk: Disk) {
        for i in 0 ..< players.count where players[i].disk == disk {
            players[i].mode = mode
        }
    }
}
