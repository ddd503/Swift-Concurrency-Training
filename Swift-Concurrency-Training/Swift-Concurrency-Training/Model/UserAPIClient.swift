//
//  APIClient.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

protocol UserAPIClient {
    func perform(request: URLRequest) async throws -> [User]
}

final class UserAPIClientImpl: UserAPIClient {
    func perform(request: URLRequest) async throws -> [User] {
        do {
            let result = try await URLSession.shared.data(for: request)
            guard let code = (result.1 as? HTTPURLResponse)?.statusCode else {
                throw NSError(domain: String(data: result.0, encoding: .utf8) ?? "Network Error", code: 999)
            }
            guard (200..<300).contains(code) else {
                throw NSError(domain: "out of statusCode range", code: code)
            }
            let userAPIResponse = try JSONDecoder().decode([User].self, from: result.0)
            return userAPIResponse
        } catch {
            throw error
        }
    }
}
