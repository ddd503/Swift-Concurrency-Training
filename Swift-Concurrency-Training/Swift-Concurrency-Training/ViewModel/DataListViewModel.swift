//
//  DataListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Combine

final class DataListViewModel: ObservableObject {

    enum State: String {
        case initialized
        case failed
        case completed
    }

    @Published var dataList = ["テスト1", "テスト2", "テスト3"]
}
