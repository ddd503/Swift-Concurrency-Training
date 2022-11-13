//
//  UserRepository.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/22.
//

import Foundation

protocol UserRepository {
    func users() async throws -> [User]
}

struct UserRepositoryImpl: UserRepository {
    private let apiClient: UserAPIClient

    init(apiClient: UserAPIClient) {
        self.apiClient = apiClient
    }

    func users() async throws -> [User] {
        let url = URL(string: "http://localhost:3000/v1/users")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        do {
            let users = try await apiClient.perform(request: urlRequest).users
            return users
        } catch {
            throw error
        }
    }
}
