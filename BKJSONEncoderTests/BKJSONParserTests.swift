//
//  BKJSONParserTests.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 13/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import XCTest

final class BKJSONParserTests: XCTestCase {
    
    private var parser: BKJSONParser!
    
    override func setUp() {
        super.setUp()
        
        parser = BKJSONParser()
    }
    
    override func tearDown() {
        parser = nil
        
        super.tearDown()
    }
    
    func test_shouldDeserialize_andNotThrow() {
        
        XCTAssertNoThrow(try parser.parse(validJSON))
    }
    
    func test_shouldDeserialize_andThrowError() {
        
        XCTAssertThrowsError(try parser.parse(invalidJSON))
    }
}
