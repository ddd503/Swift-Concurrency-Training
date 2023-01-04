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
    private let apiClient: APIClient

    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }

    func users() async throws -> [User] {
        let response = try await apiClient.perform(request: APIEndPoint.Users.request)
        return try JSONDecoder().decode([User].self, from: response)
    }
}
