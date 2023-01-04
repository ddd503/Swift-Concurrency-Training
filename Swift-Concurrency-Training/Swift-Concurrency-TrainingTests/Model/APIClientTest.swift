//
//  APIClientTest.swift
//  Swift-Concurrency-TrainingTests
//
//  Created by kawaharadai on 2023/01/04.
//

import XCTest
import OHHTTPStubs
@testable import Swift_Concurrency_Training

class APIClientTest: XCTestCase {
    // errorをスローするテストの場合はasync throwsをつければcatchしてくれる
    func test_perform_response_normal() async throws {
        let apiClient = APIClientImpl()

        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        stub(condition: isPath(APIEndPoint.Users.path)) { request in
            HTTPStubsResponse(fileAtPath: jsonFilePath, statusCode: 200, headers: nil)
        }
        // エラースローした場合にどうなる？→ ケース自体が失敗する
        let response = try await apiClient.perform(request: APIEndPoint.Users.request)
        XCTAssertNotNil(response)
    }

    func test_perform_response_error() {
        let expectation = self.expectation(description: "任意のerrorを取得できること")
        let apiClient = APIClientImpl()

        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        stub(condition: isPath(APIEndPoint.Users.path)) { request in
            HTTPStubsResponse(fileAtPath: jsonFilePath, statusCode: 400, headers: nil)
        }

        // errorをハンドリングするときはcatchで拾う
        Task {
            do {
                _ = try await apiClient.perform(request: APIEndPoint.Users.request)
            } catch let error as NSError {
                XCTAssertEqual(error.code, 400)
                XCTAssertEqual(error.domain, "out of statusCode range")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 0.1)
    }
}
