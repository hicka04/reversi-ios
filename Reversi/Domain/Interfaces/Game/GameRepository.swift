//
//  GameRepository.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/26.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation
import Combine

enum FileIOError: Error {
    case write(path: String, cause: Error?)
    case read(path: String, cause: Error?)
}

protocol GameRepository {
    func load() -> AnyPublisher<Game, FileIOError>
    func save(game: Game) -> AnyPublisher<Game, FileIOError>
}
