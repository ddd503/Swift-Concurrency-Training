//
//  APIClient.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/01/04.
//

import Foundation

protocol APIClient {
    func perform(request: URLRequest) async throws -> Data
}

final class APIClientImpl: APIClient {
    func perform(request: URLRequest) async throws -> Data {
        let result = try await URLSession.shared.data(for: request)
        guard let code = (result.1 as? HTTPURLResponse)?.statusCode else {
            throw NSError(domain: String(data: result.0, encoding: .utf8) ?? "Network Error", code: 999)
        }
        guard (200..<300).contains(code) else {
            throw NSError(domain: "out of statusCode range", code: code)
        }
        return result.0
    }
}
