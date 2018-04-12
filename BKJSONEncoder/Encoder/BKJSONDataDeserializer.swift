//
//  BKJSONDataDeserializer.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

public protocol BKJSONDataDeserializable: class {
    func deserialize(_ encodedValue: Data) throws -> Any
}

public final class BKJSONDataDeserializer: BKJSONDataDeserializable {
    
    private let options: JSONSerialization.ReadingOptions
    
    public init(readingOptions options: JSONSerialization.ReadingOptions = []) {
        self.options = options
    }
    
    public func deserialize(_ encodedValue: Data) throws -> Any {
        do {
            return try JSONSerialization.jsonObject(with: encodedValue, options: options)
        }
        catch let error {
            throw BKJSONEncodableError.deserializing(error)
        }
    }
}
