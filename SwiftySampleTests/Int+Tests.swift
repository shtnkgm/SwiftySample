//
//  Int+Tests.swift
//  SwiftySampleTests
//
//  Created by Shota Nakagami on 2018/11/18.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import XCTest
@testable import SwiftySample

class Int_Tests: XCTestCase {
    func test_priceString1() {
        // nilが返ることがない
        XCTAssertEqual(0.priceString1, "0")
        XCTAssertEqual(1.priceString1, "1")
        XCTAssertEqual(999.priceString1, "999")
        XCTAssertEqual(1000.priceString1, "1,000")
        XCTAssertEqual(1001.priceString1, "1,001")
        XCTAssertEqual(999999.priceString1, "999,999")
        XCTAssertEqual(1000000.priceString1, "1,000,000")
        XCTAssertEqual(1000001.priceString1, "1,000,001")
        XCTAssertEqual((-1).priceString1, "-1")
        XCTAssertEqual((-1000).priceString1, "-1,000")
        XCTAssertEqual(Int.max.priceString1, "9,223,372,036,854,775,807")
        
        // オーバーフローの場合は実行時クラッシュ
        // Thread 1: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
        // let value = Int.max
        // XCTAssertEqual((value + 1).priceString1, "9,223,372,036,854,775,808")
    }
    
    func test_priceString2() {
        XCTAssertEqual(0.priceString2, "0")
        XCTAssertEqual(1.priceString2, "1")
        XCTAssertEqual(999.priceString2, "999")
        XCTAssertEqual(1000.priceString2, "1,000")
        XCTAssertEqual(1001.priceString2, "1,001")
        XCTAssertEqual(999999.priceString2, "999,999")
        XCTAssertEqual(1000000.priceString2, "1,000,000")
        XCTAssertEqual(1000001.priceString2, "1,000,001")
        XCTAssertEqual((-1).priceString2, "-1")
        XCTAssertEqual((-1000).priceString2, "-1,000")
        XCTAssertEqual(Int.max.priceString2, "9,223,372,036,854,775,807")
    }
}
