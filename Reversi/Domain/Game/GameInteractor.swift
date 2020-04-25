//
//  GameInteractor.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

protocol GameUsecase: AnyObject {
    func new(completion: (Result<Game, Never>) -> Void)
    func resetGame()
    func saveGame()
    func loadGame()
}

final class GameInteractor {
    
}

extension GameInteractor: GameUsecase {
    func new(completion: (Result<Game, Never>) -> Void) {
        completion(.success(Game()))
    }
    
    func resetGame(){
        
    }
    
    func saveGame(){
        
    }
    
    func loadGame(){
        
    }
}
