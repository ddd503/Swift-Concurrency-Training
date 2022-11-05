//
//  APIClient.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

protocol UserAPIClient {
    func perform() async throws -> UserAPIResponse
}

final class UserAPIClientImpl: UserAPIClient {
    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func perform() async throws -> UserAPIResponse {
        // WIP
        UserAPIResponse.mock()
    }
}
