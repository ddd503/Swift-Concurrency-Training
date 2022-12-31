//
//  APIResponse.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

struct UserAPIResponse: Decodable {
    let users: [User]
}

// idはHashableである必要がある
struct User: Decodable, Identifiable {
    let id: ID
    let name: String
    let birthDay: String

    struct ID: Decodable, Hashable {
        let rawValue: Int
    }
}

extension User {
    static func mockUsers() -> [User] {
        return [User(id: User.ID(rawValue: 0), name: "User1", birthDay: "1992/05/31"),
                User(id: User.ID(rawValue: 1), name: "User2", birthDay: "1991/10/20"),
                User(id: User.ID(rawValue: 2), name: "User3", birthDay: "2021/12/04")]
    }
}
