//
//  BKJSONParserMock.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import Foundation

final class BKJSONParserMock: BKJSONParsable {
    
    var shouldThrowError = false
    
    func parse(_ jsonObject: Any) throws -> JSON {
        if shouldThrowError {
            throw BKJSONEncodableError.invalidJSON
        }
        return expectedPersonJSON
    }
}
