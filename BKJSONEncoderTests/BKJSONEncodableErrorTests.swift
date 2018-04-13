//
//  BKJSONEncodableErrorTests.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 13/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import XCTest

final class BKJSONEncodableErrorTests: XCTestCase {
    
    func test_shouldConformTo_equatableProtocol() {
        
        let error: Error = BKJSONEncodableError.invalidJSON
        
        XCTAssertEqual(BKJSONEncodableError.encoding(error), BKJSONEncodableError.encoding(error))
        
        XCTAssertEqual(BKJSONEncodableError.deserializing(error), BKJSONEncodableError.deserializing(error))
        
        XCTAssertEqual(BKJSONEncodableError.invalidJSON, BKJSONEncodableError.invalidJSON)
        
        XCTAssertEqual(BKJSONEncodableError.other(error), BKJSONEncodableError.other(error))
    }
}
