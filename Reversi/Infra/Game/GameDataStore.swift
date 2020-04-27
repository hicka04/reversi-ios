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
    private let path = (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! as NSString).appendingPathComponent("Game")
}

extension GameDataStore: GameRepository {
    func load() -> AnyPublisher<Game, FileIOError> {
        Deferred {
            Future { promise in
                promise(.success(Game()))
            }
        }.eraseToAnyPublisher()
    }

    func save(game: Game) -> AnyPublisher<Game, FileIOError> {
        Deferred {
            Future { promise in
                var game = game
                var output: String = ""
                output += game.turn.symbol
                for player in game.players {
                    output += player.mode.rawValue.description
                }
                output += "\n"

                for y in game.board.range.y {
                    for x in game.board.range.x {
                        let coordinate = Coordinate(x: x, y: y)
                        output += game.board.cells.first { $0.coordinate == coordinate }!.disk.symbol
                    }
                }

                do {
                    defer {
                        promise(.success(game))
                    }

                    try output.write(toFile: self.path, atomically: true, encoding: .utf8)
                } catch let error {
                    promise(.failure(FileIOError.read(path: self.path, cause: error)))
                }
            }
        }.eraseToAnyPublisher()
    }
}

extension Optional where Wrapped == Disk {
    fileprivate init?<S: StringProtocol>(symbol: S) {
        switch symbol {
        case "x":
            self = .some(.dark)
        case "o":
            self = .some(.light)
        case "-":
            self = .none
        default:
            return nil
        }
    }

    fileprivate var symbol: String {
        switch self {
        case .some(.dark):
            return "x"
        case .some(.light):
            return "o"
        case .none:
            return "-"
        }
    }
}
