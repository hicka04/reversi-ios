//
//  GameInteractor.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation
import Combine

protocol GameUsecase: AnyObject {
    func new() -> AnyPublisher<Game, Never>
    func resetGame()
    func saveGame()
    func loadGame()
}

final class GameInteractor {
    
}

extension GameInteractor: GameUsecase {
    func new() -> AnyPublisher<Game, Never> {
        Just(Game()).eraseToAnyPublisher()
    }
    
    func resetGame(){
        
    }
    
    func saveGame(){
        
    }
    
    func loadGame(){
        
    }
}
