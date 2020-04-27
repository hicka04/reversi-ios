//
//  GameDataStore.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/26.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation
import Combine

final class GameDataStore {
    private let path = ""
}

extension GameDataStore: GameRepository {
    func load() -> AnyPublisher<Game, FileIOError> {
        Deferred {
            Future { promise in
                promise(.success(Game()))
            }
        }.eraseToAnyPublisher()
    }

    func save() -> AnyPublisher<Void, FileIOError> {
        Deferred {
            Future { promise in
                promise(.success(()))
            }
        }.eraseToAnyPublisher()
    }
}
