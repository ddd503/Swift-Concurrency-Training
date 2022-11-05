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

struct APIRepositoryImpl: UserRepository {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func users() async throws -> [User] {
        try! await apiClient.perform().users
    }
}
