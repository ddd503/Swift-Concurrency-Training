//
//  PhotoListState.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/05/02.
//

struct PhotoListState: Equatable {
    var isShowlist: Bool
    var isShowErrorView: Bool

    init(isShowlist: Bool = false, isShowErrorView: Bool = false) {
        self.isShowlist = isShowlist
        self.isShowErrorView = isShowErrorView
    }
}
