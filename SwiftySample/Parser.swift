//
//  Parser.swift
//  SwiftySample
//
//  Created by Shota Nakagami on 2018/11/18.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation
import SwiftyJSON

// Bad
struct User1 {
    var identifier: String?
    var personName: PersonName?
    var address: Address?
    
    struct PersonName {
        var firstName: String?
        var lastName: String?
    }
    
    struct Address {
        var postalCode: String?
        var prefecture: String?
    }
    
    init(json: JSON) {
        identifier = json["identifier"].string
        personName = PersonName(firstName: json["person_name"]["first_name"].string,
                                lastName: json["person_name"]["last_name"].string)
        address = Address(postalCode: json["address"]["postal_code"].string,
                          prefecture: json["address"]["prefecture"].string)
    }
}

// Bad
struct User2 {
    let identifier: String
    let personName: PersonName
    let address: Address
    
    struct PersonName {
        let firstName: String
        let lastName: String
    }
    
    struct Address {
        let postalCode: String
        let prefecture: String
    }
    
    init(json: JSON) {
        identifier = json["identifier"].stringValue
        personName = PersonName(firstName: json["person_name"]["first_name"].stringValue,
                                lastName: json["person_name"]["last_name"].stringValue)
        address = Address(postalCode: json["address"]["postal_code"].stringValue,
                          prefecture: json["address"]["prefecture"].stringValue)
    }
}

// Good
struct User3 {
    let identifier: String
    let personName: PersonName
    let address: Address?
    
    struct PersonName {
        let firstName: String
        let lastName: String
    }
    
    struct Address {
        let postalCode: String
        let prefecture: String
    }
    
    init?(json: JSON) {
        guard let identifier = json["identifier"].string,
            let firstName = json["person_name"]["first_name"].string,
            let lastName = json["person_name"]["last_name"].string else { return nil }
        self.identifier = identifier
        self.personName = PersonName(firstName: firstName, lastName: lastName)
        
        if let postalCode = json["address"]["postal_code"].string,
            let prefecture = json["address"]["prefecture"].string {
            address = Address(postalCode: postalCode, prefecture: prefecture)
        } else {
            address = nil
        }
    }
}

// Good
struct User4: Codable {
    let identifier: String
    let personName: PersonName
    let address: Address?
    
    struct PersonName: Codable {
        let firstName: String
        let lastName: String
    }
    
    struct Address: Codable {
        let postalCode: String
        let prefecture: String
    }
    
    init?(jsonData: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let user = try? decoder.decode(User4.self, from: jsonData) else { return nil }
        self = user
    }
}
