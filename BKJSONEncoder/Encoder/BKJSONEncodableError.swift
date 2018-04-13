//
//  BKJSONEncodableError.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

public enum BKJSONEncodableError: Error {
    case encoding(Error)
    case deserializing(Error)
    case invalidJSON
    case other(Error)
}
