//
//  DataListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Combine

final class DataListViewModel: ObservableObject {

    // 使い方決める
    enum State: String {
        case initialized
        case failed
        case completed
    }

    @Published var dataList = ["テスト1", "テスト2", "テスト3"]

    func onAppear() {
        fetchTestData()
    }

    func pullToRefresh() {
        fetchTestData()
    }

    private func fetchTestData() {
        // repository経由でAPI叩いて適当なデータを受け取る
        // dataListの値を更新する
    }
}
