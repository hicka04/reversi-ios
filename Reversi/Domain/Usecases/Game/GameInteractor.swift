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
    func reset() -> AnyPublisher<Game, Never>
    func load() -> AnyPublisher<Game, Never>
}

final class GameInteractor {
    private let dataStore: GameRepository

    init(dataStore: GameRepository = GameDataStore()) {
        self.dataStore = dataStore
    }
}

extension GameInteractor: GameUsecase {
    func reset() -> AnyPublisher<Game, Never> {
        Just(Game()).eraseToAnyPublisher()
    }
    
    func load() -> AnyPublisher<Game, Never> {
        dataStore
            .load()
            .catch { _ in self.reset() }
            .eraseToAnyPublisher()
    }
}
