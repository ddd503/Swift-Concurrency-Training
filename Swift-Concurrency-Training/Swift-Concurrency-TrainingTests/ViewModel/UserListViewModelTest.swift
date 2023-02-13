//
//  UserListViewModelTest.swift
//  Swift-Concurrency-TrainingTests
//
//  Created by kawaharadai on 2023/01/21.
//

import XCTest
import EntwineTest
@testable import Swift_Concurrency_Training

class UserListViewModelTest: XCTestCase {

    func test_fetchUser_取得成功() async {
        let repoMock = UserRepositoryMock()
        repoMock.isSuccess = true
        let viewModel = UserListViewModel(userRepository: repoMock)
        await viewModel.fetchUser()
        XCTAssertEqual(viewModel.viewState, .completed)
        XCTAssertEqual(viewModel.userList.count, 51)
    }

    func test_fetchUser_取得失敗() async {
        let repoMock = UserRepositoryMock()
        repoMock.isSuccess = false
        let viewModel = UserListViewModel(userRepository: repoMock)
        await viewModel.fetchUser()
        XCTAssertEqual(viewModel.viewState, .failed)
        XCTAssertEqual(viewModel.userList.count, 0)
    }

    func test_cancel() {
        let repoMock = UserRepositoryMock()
        let viewModel = UserListViewModel(userRepository: repoMock)
        viewModel.cancel()
        XCTAssertEqual(viewModel.viewState, .completed)
    }

}

class UserRepositoryMock: UserRepository {
    var isSuccess: Bool?

    func users() async throws -> [User] {
        if isSuccess ?? false {
            return User.usersMock()
        } else {
            throw NSError(domain: "test", code: 999)
        }
    }
}
