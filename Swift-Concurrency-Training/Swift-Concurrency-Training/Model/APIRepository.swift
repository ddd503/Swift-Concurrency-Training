//
//  APIRepository.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/22.
//

import Foundation

protocol APIRepository {
    func users() async throws -> [User]
}

struct APIRepositoryImpl: APIRepository {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func users() async throws -> [User] {
        try! await apiClient.perform().users
    }
}
