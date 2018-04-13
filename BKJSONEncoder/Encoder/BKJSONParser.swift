//
//  BKJSONParser.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

public protocol BKJSONParsable: class {
    func parse(_ jsonObject: Any) throws -> JSON
}

public final class BKJSONParser: BKJSONParsable {
    
    public init() {}

    public func parse(_ jsonObject: Any) throws -> JSON {
        guard let json = jsonObject as? JSON else {
            throw BKJSONEncodableError.invalidJSON
        }
        return json
    }
}
