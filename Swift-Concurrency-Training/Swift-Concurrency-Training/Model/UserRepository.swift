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
        try! await apiClient.perform().users
    }
}
