//
//  Result.swift
//  SwiftySample
//
//  Created by Shota Nakagami on 2018/11/19.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}
