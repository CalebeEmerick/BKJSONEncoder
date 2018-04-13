//
//  BKJSONDataDeserializerMock.swift
//  BKJSONEncoderTests
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import BKJSONEncoder
import Foundation

final class BKJSONDataDeserializerMock: BKJSONDataDeserializable {
    
    var shouldThrowError = false
    
    func deserialize(_ encodedValue: Data) throws -> Any {
        if shouldThrowError {
            throw BKJSONEncodableError.deserializing(BKJSONEncodableError.invalidJSON)
        }
        return expectedPersonJSON
    }
}
