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
        case loading
        case failed
        case completed
    }

    @Published private(set) var dataList = User.mockUsers()
    @Published private(set) var viewState = DataListViewState.loading
    private let userRepository: UserRepository
    private var fetchDataHandler: Task<Void, Never>?

    init(userRepository: UserRepository = UserRepositoryImpl()) {
        self.userRepository = userRepository
    }

    func onAppear() {
        fetchData()
    }

    func pullToRefresh() {
        fetchData()
    }

    func onTapReloadButton() {
        fetchData()
    }

    func cancel() {
        fetchDataHandler?.cancel()
        viewState = .completed
    }

    private func fetchData() {
        viewState = .loading
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
