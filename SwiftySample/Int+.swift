//
//  Int+.swift
//  SwiftySample
//
//  Created by Shota Nakagami on 2018/11/18.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

extension Int {
    // Bad
    var priceString1: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: NSNumber(integerLiteral: self))
    }
    
    // Good
    var priceString2: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? String(self)
    }
}
