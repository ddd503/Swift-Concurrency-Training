//
//  DataListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Combine

// Task内が非同期で流れているのでメインで受けるため
@MainActor
final class DataListViewModel: ObservableObject {

    enum DataListViewState: String {
        case initialized
        case failed
        case completed
    }

    @Published private(set) var dataList = User.mockUsers()
    @Published private(set) var viewState = DataListViewState.initialized
    private let userRepository: UserRepository
    private var fetchDataHandler: Task<Void, Never>?

    init(userRepository: UserRepository = UserRepositoryImpl()) {
        self.userRepository = userRepository
    }

    func onAppear() {
        fetchTestData()
    }

    func pullToRefresh() {
        fetchTestData()
    }

    func onTapReloadButton() {
        fetchTestData()
    }

    func cancel() {
        fetchDataHandler?.cancel()
    }

    private func fetchTestData() {
        fetchDataHandler = Task {
            do {
                dataList = try await userRepository.users()
                viewState = .completed
            } catch {
                // fetch中にエラー発生
                viewState = .failed
            }
        }
    }
}
