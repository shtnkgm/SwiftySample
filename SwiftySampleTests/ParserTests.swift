//
//  ParserTests.swift
//  SwiftySampleTests
//
//  Created by Shota Nakagami on 2018/11/18.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import SwiftySample

class ParserTests: XCTestCase {    
    func jsonData(fileName: String) -> Data {
        let bundle = Bundle(for: ParserTests.self)
        let path = bundle.path(forResource: fileName, ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        return data
    }
    
    func json(fileName: String) -> JSON {
        let json = try! JSON(data: jsonData(fileName: fileName))
        return json
    }
    
    func test_user1() {
        let user = User1(json: json(fileName: "User"))
        XCTAssertEqual(user.identifier, "0001")
        XCTAssertEqual(user.personName?.firstName, "Shota")
        XCTAssertEqual(user.personName?.lastName, "Nakagami")
        XCTAssertEqual(user.address?.postalCode, "1028282")
        XCTAssertEqual(user.address?.prefecture, "東京都")
        
        let userWithoutAddress = User1(json: json(fileName: "UserWithoutAddress"))
        XCTAssertEqual(userWithoutAddress.identifier, "0001")
        XCTAssertEqual(userWithoutAddress.personName?.firstName, "Shota")
        XCTAssertEqual(userWithoutAddress.personName?.lastName, "Nakagami")
        XCTAssertEqual(userWithoutAddress.address?.postalCode, nil)
        XCTAssertEqual(userWithoutAddress.address?.prefecture, nil)
    }
    
    func test_user2() {
        let user = User2(json: json(fileName: "User"))
        XCTAssertEqual(user.identifier, "0001")
        XCTAssertEqual(user.personName.firstName, "Shota")
        XCTAssertEqual(user.personName.lastName, "Nakagami")
        XCTAssertEqual(user.address.postalCode, "1028282")
        XCTAssertEqual(user.address.prefecture, "東京都")
        
        let userWithoutAddress = User2(json: json(fileName: "UserWithoutAddress"))
        XCTAssertEqual(userWithoutAddress.identifier, "0001")
        XCTAssertEqual(userWithoutAddress.personName.firstName, "Shota")
        XCTAssertEqual(userWithoutAddress.personName.lastName, "Nakagami")
        XCTAssertEqual(userWithoutAddress.address.postalCode, "")
        XCTAssertEqual(userWithoutAddress.address.prefecture, "")
    }
    
    func test_user3() {
        let user = User3(json: json(fileName: "User"))
        XCTAssertEqual(user?.identifier, "0001")
        XCTAssertEqual(user?.personName.firstName, "Shota")
        XCTAssertEqual(user?.personName.lastName, "Nakagami")
        XCTAssertEqual(user?.address?.postalCode, "1028282")
        XCTAssertEqual(user?.address?.prefecture, "東京都")
        
        let userWithoutAddress = User3(json: json(fileName: "UserWithoutAddress"))
        XCTAssertEqual(userWithoutAddress?.identifier, "0001")
        XCTAssertEqual(userWithoutAddress?.personName.firstName, "Shota")
        XCTAssertEqual(userWithoutAddress?.personName.lastName, "Nakagami")
        XCTAssertEqual(userWithoutAddress?.address?.postalCode, nil)
        XCTAssertEqual(userWithoutAddress?.address?.prefecture, nil)
    }
    
    func test_user4() {
        let user = User4(json: json(fileName: "User"))
        XCTAssertEqual(user?.identifier, "0001")
        XCTAssertEqual(user?.personName.firstName, "Shota")
        XCTAssertEqual(user?.personName.lastName, "Nakagami")
        XCTAssertEqual(user?.address?.postalCode, "1028282")
        XCTAssertEqual(user?.address?.prefecture, "東京都")
        
        let userWithoutAddress = User3(json: json(fileName: "UserWithoutAddress"))
        XCTAssertEqual(userWithoutAddress?.identifier, "0001")
        XCTAssertEqual(userWithoutAddress?.personName.firstName, "Shota")
        XCTAssertEqual(userWithoutAddress?.personName.lastName, "Nakagami")
        XCTAssertEqual(userWithoutAddress?.address?.postalCode, nil)
        XCTAssertEqual(userWithoutAddress?.address?.prefecture, nil)
    }
    
    func test_user5() {
        let user = User5(jsonData: jsonData(fileName: "User"))
        XCTAssertEqual(user?.identifier, "0001")
        XCTAssertEqual(user?.personName.firstName, "Shota")
        XCTAssertEqual(user?.personName.lastName, "Nakagami")
        XCTAssertEqual(user?.address?.postalCode, "1028282")
        XCTAssertEqual(user?.address?.prefecture, "東京都")
        
        let userWithoutAddress = User5(jsonData: jsonData(fileName: "UserWithoutAddress"))
        XCTAssertEqual(userWithoutAddress?.identifier, "0001")
        XCTAssertEqual(userWithoutAddress?.personName.firstName, "Shota")
        XCTAssertEqual(userWithoutAddress?.personName.lastName, "Nakagami")
        XCTAssertEqual(userWithoutAddress?.address?.postalCode, nil)
        XCTAssertEqual(userWithoutAddress?.address?.prefecture, nil)
    }
}
