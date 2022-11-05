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

struct User: Decodable {
    let id: ID
    let name: String
    let birthDay: String

    struct ID: Decodable {
        let rawValue: Int
    }
}

extension UserAPIResponse {
    static func mock() -> UserAPIResponse {
        let id = User.ID(rawValue: 0)
        let user = User(id: id, name: "name", birthDay: "1992/05/31")
        return UserAPIResponse(users: [user])
    }
}
