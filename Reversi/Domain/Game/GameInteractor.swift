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
    func load() -> AnyPublisher<Game, Never>
}

final class GameInteractor {
    
}

extension GameInteractor: GameUsecase {
    func new() -> AnyPublisher<Game, Never> {
        Just(Game()).eraseToAnyPublisher()
    }
    
    func load() -> AnyPublisher<Game, Never> {
        new()
    }
}
