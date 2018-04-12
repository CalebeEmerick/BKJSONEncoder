//
//  BKJSONEncodableError.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

public enum BKJSONEncodableError: Error {
    case encoding(EncodingError)
    case deserializing(Error)
    case invalidJSON
}

extension BKJSONEncodableError: Equatable {
    public static func == (lhs: BKJSONEncodableError, rhs: BKJSONEncodableError) -> Bool {
        switch (lhs, rhs) {
        case (.encoding, .encoding):
            return true
        case (.deserializing, .deserializing):
            return true
        case (.invalidJSON, .invalidJSON):
            return true
        default:
            return false
        }
    }
}
