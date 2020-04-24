//
//  ReversiPresenter.swift
//  Reversi
//
//  Created by hicka04 on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

protocol ReversiPresentation: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
    
    func pressResetButtonOk()
    
    func didSelectCell(at coordinate: Coordinate)
}

final class ReversiPresenter {
    private weak var view: ReversiView?
    private let gameInteractor: GameUsecase
    
    init(view: ReversiView,
         gameInteractor: GameUsecase) {
        self.view = view
        self.gameInteractor = gameInteractor
    }
}

extension ReversiPresenter: ReversiPresentation {
    func viewDidLoad() {
        // ゲームをロード
        // 失敗したら新しいゲームを作成
        gameInteractor.newGame()
    }
    
    func viewDidAppear() {
        // 初回表示のときだけユーザーの入力街状態にセットする
    }
    
    func pressResetButtonOk() {
        // リセットボタンのアラートでOKが押されたら
        // 新しいゲームを作成
    }
    
    func didSelectCell(at coordinate: Coordinate) {
        // 指定座標にdiskを置く
        // おけない座標だったらエラー返す
    }
}
