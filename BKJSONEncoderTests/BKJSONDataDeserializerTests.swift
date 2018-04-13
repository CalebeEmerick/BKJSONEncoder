//
//  BKJSONDataDeserializerTests.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 13/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import XCTest

final class BKJSONDataDeserializerTests: XCTestCase {
    
    private var deserializer: BKJSONDataDeserializer!
    
    override func setUp() {
        super.setUp()
        
        deserializer = BKJSONDataDeserializer(readingOptions: .allowFragments)
    }
    
    override func tearDown() {
        deserializer = nil
        
        super.tearDown()
    }
    
    func test_shouldDeserialize_andNotThrow() {
        
        let encodedPerson = try! JSONEncoder().encode(person)
        
        XCTAssertNoThrow(try deserializer.deserialize(encodedPerson))
    }
    
    func test_shouldDeserialize_andThrowError() {
        
        XCTAssertThrowsError(try deserializer.deserialize(Data()))
    }
}
