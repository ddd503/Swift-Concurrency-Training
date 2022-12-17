//
//  UserAPIClientImplTest.swift
//  Swift-Concurrency-TrainingTests
//
//  Created by kawaharadai on 2022/11/05.
//

import XCTest
import OHHTTPStubs
@testable import Swift_Concurrency_Training

class UserAPIClientImplTest: XCTestCase {

    // errorをスローするテストの場合はasync throwsをつければcatchしてくれる
    func test_perform_response_normal() async throws {
        let apiClient = UserAPIClientImpl()
        let testRequest = URLRequest(url: URL(string: "http://localhost:3000/v1/users")!)
        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        stub(condition: isPath("/v1/users")) { request in
            HTTPStubsResponse(fileAtPath: jsonFilePath, statusCode: 200, headers: nil)
        }
        // エラースローした場合にどうなる？→ ケース自体が失敗する
        let response = try await apiClient.perform(request: testRequest)
        XCTAssertEqual(response.count, 3)
    }

    func test_perform_response_error() {
        let expectation = self.expectation(description: "任意のerrorを取得できること")
        let apiClient = UserAPIClientImpl()
        let testRequest = URLRequest(url: URL(string: "http://localhost:3000/v1/users")!)
        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        stub(condition: isPath("/v1/users")) { request in
            HTTPStubsResponse(fileAtPath: jsonFilePath, statusCode: 400, headers: nil)
        }

        // errorをハンドリングするときはcatchで拾う
        Task {
            do {
                _ = try await apiClient.perform(request: testRequest)
            } catch let error as NSError {
                XCTAssertEqual(error.code, 400)
                XCTAssertEqual(error.domain, "out of statusCode range")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 0.1)
    }

}
