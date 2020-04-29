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
                var game = Game()
                
                guard let input = try? String(contentsOfFile: self.path, encoding: .utf8) else {
                    promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                    return
                }
                var lines: ArraySlice<Substring> = input.split(separator: "\n")[...]

                guard var line = lines.popFirst() else {
                    promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                    return
                }

                // trun
                guard
                    let diskSymbol = line.popFirst(),
                    let disk = Optional<Disk>(symbol: diskSymbol.description)
                else {
                    promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                    return
                }
                game.turn = disk
                
                // players
                game.players.forEach { player in
                    guard
                        let playerSymbol = line.popFirst(),
                        let playerNumber = Int(playerSymbol.description)
                    else {
                        return
                    }
                    
                    let mode = Player.Mode(rawValue: playerNumber) ?? .manual
                    game.updatePlayerMode(mode, of: player.disk)
                }
                
                // board
                guard lines.count == game.board.size.height else {
                    promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                    return
                }
                
                var y = 0
                while let line = lines.popFirst() {
                    var x = 0
                    for character in line {
                        let disk = Disk?(symbol: "\(character)").flatMap { $0 }
                        game.board.updateDisk(disk, at: Coordinate(x: x, y: y))
                        x += 1
                    }
                    guard x == game.board.size.width else {
                        promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                        return
                    }
                    y += 1
                }
                guard y == game.board.size.height else {
                    promise(.failure(FileIOError.read(path: self.path, cause: nil)))
                    return
                }
                
                promise(.success(game))
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
                    output += "\n"
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
