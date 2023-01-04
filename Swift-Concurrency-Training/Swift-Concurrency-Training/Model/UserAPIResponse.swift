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
    static func usersMock() -> [User] {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/mm/dd"
        return (0...50).map({ num -> User in
            let birthDay = Calendar.current.date(byAdding: .day, value: num + 1, to: today)!
            return User(id: User.ID(rawValue: num),
                        name: "User\(num)",
                        birthDay: formatter.string(from: birthDay))
        })
    }

    static func userMock() -> User {
        User(id: User.ID(rawValue: 100),
             name: "山田　太郎",
             birthDay: "1990/05/21")
    }
}
