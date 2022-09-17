//
//  DataListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Foundation

final class DataListViewModel: ObservableObject {
    enum State: String {
        case initialized
        case failed
        case completed
    }
}
