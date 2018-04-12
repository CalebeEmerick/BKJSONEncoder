//
//  BKJSONEncoderTests.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import XCTest

final class BKJSONEncoderTests: XCTestCase {
    
    private var deserializer: BKJSONDataDeserializerMock!
    private var parser: BKJSONParserMock!
    private var encoder: BKJSONEncoder!
    
    private let person = Person(name: "LeBron James", age: 33, favoriteColor: "red")
    
    private let failablePerson = PersonFailable(name: "Kevin Durant", age: 28, someValue: Double.infinity)
    
    private struct Person: Codable {
        let name: String
        let age: Int
        let favoriteColor: String
    }
    
    private struct PersonFailable: Codable {
        let name: String
        let age: Int
        let someValue: Double
    }
    
    private var expectedPersonJSON: JSON {
        return [
            "name": "LeBron James",
            "age": 33,
            "favorite_color": "red"
        ]
    }
    
    override func setUp() {
        super.setUp()
        
        deserializer = BKJSONDataDeserializerMock()
        parser = BKJSONParserMock()
        encoder = BKJSONEncoder(deserializer: deserializer, parser: parser)
    }
    
    override func tearDown() {
        encoder = nil
        deserializer = nil
        parser = nil
        
        super.tearDown()
    }
    
    func test_shouldEncode_andNotThrow() {
        XCTAssertNoThrow(try encoder.encode(person))
    }
    
    func test_expect_encodedJSON_toBeEqual_expectedResult() {
        let jsonPerson = try! encoder.encode(person)
        XCTAssertEqual(jsonPerson as NSDictionary, expectedPersonJSON as NSDictionary)
    }
    
    func test_shouldThrow_encodeError() {
        XCTAssertThrowsError(try encoder.encode(failablePerson), "Should throw an encode error") { error in
            guard let error = error as? BKJSONEncodableError,
                case .encoding = error else {
                    fatalError("The error type should be JSONEncodableError")
            }
        }
    }
    
    func test_shouldThrow_deserializationError() {
        deserializer.shouldThrowError = true
        XCTAssertThrowsError(try encoder.encode(person), "Should throw an encode error") { error in
            guard let error = error as? BKJSONEncodableError,
                case .deserializing = error else {
                    fatalError("The error type should be JSONEncodableError")
            }
        }
    }
    
    func test_shouldThrow_invalidJSONError() {
        parser.shouldThrowError = true
        XCTAssertThrowsError(try encoder.encode(person), "Should throw an encode error") { error in
            guard let error = error as? BKJSONEncodableError,
                case .invalidJSON = error else {
                fatalError("The error type should be JSONEncodableError")
            }
        }
    }
}
