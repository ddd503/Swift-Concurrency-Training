//
//  APIClient.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

final class APIClient {
    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func perform() async throws -> APIResponse {
        // WIP
        APIResponse()
    }
}
