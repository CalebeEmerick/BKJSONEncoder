//
//  SharedPerson.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 13/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import Foundation

struct Person: Codable {
    let name: String
    let age: Int
    let favoriteColor: String
}

struct PersonFailable: Codable {
    let name: String
    let age: Int
    let someValue: Double
}

let person = Person(name: "LeBron James", age: 33, favoriteColor: "red")

let failablePerson = PersonFailable(name: "Kevin Durant", age: 28, someValue: Double.infinity)

let validJSON: Any = expectedPersonJSON
let invalidJSON: Any = "I'm a string..."

let genericError: Error = BKJSONEncodableError.invalidJSON

var expectedPersonJSON: JSON {
    return [
        "name": "LeBron James",
        "age": 33,
        "favorite_color": "red"
    ]
}
