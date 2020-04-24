//
//  GameInteractor.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

protocol GameUsecase: AnyObject {
    func newGame()
    func resetGame()
    func saveGame()
    func loadGame()
}

final class GameInteractor {
    
}

extension GameInteractor: GameUsecase {
    func newGame() {
        
    }
    
    func resetGame(){
        
    }
    
    func saveGame(){
        
    }
    
    func loadGame(){
        
    }
}
