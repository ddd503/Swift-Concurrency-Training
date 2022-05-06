//
//  PhotoListView+Reducer.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/05/02.
//

import ComposableArchitecture

extension PhotoListView {
    static func reducer() -> Reducer<PhotoListState, PhotoListAction, AppEnvironment> {
        return Reducer<PhotoListState, PhotoListAction, AppEnvironment> { state, action, environment in
            switch action {
            case .onAppear:
                // action毎にstateのプロパティを変更する
                // 変更時にロジックが必要ならenvironment使ってEffectをreturnする
                return .none
            }
        }
    }
}
