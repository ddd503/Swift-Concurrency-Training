//
//  APIClient.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

protocol APIClient {
    func perform() async throws -> APIResponse
}

final class APIClientImpl: APIClient {
    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func perform() async throws -> APIResponse {
        // WIP
        APIResponse.mock()
    }
}
