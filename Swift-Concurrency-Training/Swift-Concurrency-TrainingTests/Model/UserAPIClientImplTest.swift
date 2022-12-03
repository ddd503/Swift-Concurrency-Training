//
//  UserAPIClientImplTest.swift
//  Swift-Concurrency-TrainingTests
//
//  Created by kawaharadai on 2022/11/05.
//

import XCTest
import Mockingjay
@testable import Swift_Concurrency_Training

class UserAPIClientImplTest: XCTestCase {

    // errorをスローするテストの場合はasync throwsをつければcatchしてくれる
    func test_perform_response_normal() async throws {
        let apiClient = UserAPIClientImpl()
        let dummyReqest = URLRequest(url: URL(string: "http://localhost:3000/v1/users")!)
        let reqestUrlString = "http://localhost:3000/v1/users"
        let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "dummy_users", ofType: "json")!
        let responseData = try! Data(contentsOf: URL(fileURLWithPath: jsonFilePath), options: .mappedIfSafe)
        stub(http(.get, uri: reqestUrlString), jsonData(responseData))
        // エラースローした場合にどうなる？
        let response = try await apiClient.perform(request: dummyReqest)
        XCTAssertEqual(response.users.count, 2)
    }

}
