//
//  APIClient.swift
//  SwiftySample
//
//  Created by Shota Nakagami on 2018/11/19.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

enum APIClientError: Error {
    case noLogin
    case connectionError
}

// Bad
struct APIClient1 {
    func request(completion: @escaping (_ value: Int?, _ error: Error?) -> Void) {
        DispatchQueue.main.async {
            completion(0, nil)
        }
    }
}

// Bad
struct APIClient2 {
    func request(completion: @escaping (_ result: Result<Int, APIClientError>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(0))
        }
    }
}
