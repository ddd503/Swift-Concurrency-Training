//
//  APIResponse.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/10/15.
//

import Foundation

// APIレスポンス決めてCodableでパースする
struct APIResponse {
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

extension APIResponse {
    static func mock() -> APIResponse {
        let id = User.ID(rawValue: 0)
        let user = User(id: id, name: "name", birthDay: "1992/05/31")
        return APIResponse(users: [user])
    }
}
