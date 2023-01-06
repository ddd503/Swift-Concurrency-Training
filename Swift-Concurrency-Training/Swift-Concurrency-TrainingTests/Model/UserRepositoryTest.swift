//
//  UserRepositoryTest.swift
//  Swift-Concurrency-TrainingTests
//
//  Created by kawaharadai on 2023/01/06.
//

import XCTest
@testable import Swift_Concurrency_Training

class UserRepositoryTest: XCTestCase {

    func test_users_正常なDataを取得() async throws {
        let apiClient = APIClientMock()
        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        let mockData = try! Data(contentsOf: URL(fileURLWithPath: jsonFilePath))
        apiClient.responseData = mockData
        let repository = UserRepositoryImpl(apiClient: apiClient)

        let users = try await repository.users()

        XCTAssertEqual(users.count, 3)
    }

    func test_users_異常なDataを取得() {
        let expectation = self.expectation(description: "パース失敗時のエラーを取得できること")
        let apiClient = APIClientMock()
        let mockData = Data(bytes: [1, 2, 3], count: MemoryLayout.size(ofValue: 3))
        apiClient.responseData = mockData
        let repository = UserRepositoryImpl(apiClient: apiClient)

        // errorをハンドリングするときはcatchで拾う
        Task {
            do {
                _ = try await repository.users()
            } catch {
                print(error.localizedDescription)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 0.1)
    }
}

final class APIClientMock: APIClient {
    var responseData: Data?

    func perform(request: URLRequest) async throws -> Data {
        responseData!
    }
}
