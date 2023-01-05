//
//  UserListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Combine

// Task内が非同期で流れているのでメインで受けるため
@MainActor
final class UserListViewModel: ObservableObject {

    enum UserListViewState: String {
        case loading
        case failed
        case completed
    }

    @Published private(set) var userList = User.usersMock()
    @Published private(set) var viewState = UserListViewState.loading
    private let userRepository: UserRepository
    private var fetchDataHandler: Task<Void, Never>?

    init(userRepository: UserRepository = UserRepositoryImpl()) {
        self.userRepository = userRepository
    }

    func onAppear() {
        fetchUser()
    }

    func pullToRefresh() {
        fetchUser()
    }

    func onTapReloadButton() {
        fetchUser()
    }

    func cancel() {
        fetchDataHandler?.cancel()
        viewState = .completed
    }

    private func fetchUser() {
        viewState = .loading
        fetchDataHandler = Task {
            do {
                userList = try await userRepository.users()
                viewState = .completed
            } catch {
                // fetch中にエラー発生
                viewState = .failed
            }
        }
    }
}
