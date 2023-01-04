//
//  APIEndPoint.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/01/04.
//

import Foundation

enum APIEndPoint {
    case Users

    var request: URLRequest {
        let url = URL(string: "http://localhost:3000\(self.path)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.httpMethod
        return urlRequest
    }

    var path: String {
        switch self {
        case .Users:
            return "/v1/users"
        }
    }

    var httpMethod: String {
        switch self {
        case .Users:
            return "GET"
        }
    }
}
