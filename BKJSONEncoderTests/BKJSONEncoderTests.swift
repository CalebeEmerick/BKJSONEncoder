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
    
    private func shouldThrowErrorFor<T>(_ encodedValue: T, andExpectError type: BKJSONEncodableError) where T: Encodable {
        XCTAssertThrowsError(try encoder.encode(encodedValue)) { error in
            guard let error = error as? BKJSONEncodableError else {
                return XCTFail("The error type should be JSONEncodableError")
            }
            XCTAssertEqual(error, type)
        }
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
        shouldThrowErrorFor(failablePerson, andExpectError: .encoding(genericError))
    }
    
    func test_shouldThrow_deserializationError() {
        deserializer.shouldThrowError = true
        shouldThrowErrorFor(person, andExpectError: .deserializing(genericError))
    }
    
    func test_shouldThrow_invalidJSONError() {
        parser.shouldThrowError = true
        shouldThrowErrorFor(person, andExpectError: .invalidJSON)
    }
}
