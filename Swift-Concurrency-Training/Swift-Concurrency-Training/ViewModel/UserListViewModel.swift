//
//  UserListViewModel.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/17.
//

import Combine

final class UserListViewModel: ObservableObject {
    enum UserListViewState: String {
        case loading
        case failed
        case completed
    }

    @Published private(set) var userList = [User]()
    @Published private(set) var viewState = UserListViewState.loading
    private let userRepository: UserRepository

    init(userRepository: UserRepository = UserRepositoryImpl()) {
        self.userRepository = userRepository
    }

    func fetchUser() async {
        viewState = .loading
        do {
            userList = try await userRepository.users()
            viewState = .completed
        } catch {
            // fetch中にエラー発生
            viewState = .failed
        }
    }

    func cancel() {
        viewState = .completed
    }
}
