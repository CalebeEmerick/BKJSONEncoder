//
//  BKJSONEncoder.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

public var defaultBKEncoder: JSONEncoder {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.outputFormatting = .prettyPrinted
    return encoder
}

public final class BKJSONEncoder {
    
    private let deserializer: BKJSONDataDeserializable
    private let parser: BKJSONParsable
    private let encoder: JSONEncoder
    
    public init(
        deserializer: BKJSONDataDeserializable = BKJSONDataDeserializer(),
        parser: BKJSONParsable = BKJSONParser(),
        encoder: JSONEncoder = defaultBKEncoder
    ) {
        self.deserializer = deserializer
        self.parser = parser
        self.encoder = encoder
    }
    
    public func encode<T>(_ value: T) throws -> JSON where T: Encodable {
        do {
            let encodedValue = try encoder.encode(value)
            let jsonObject = try deserializer.deserialize(encodedValue)
            let json = try parser.parse(jsonObject)
            return json
        }
        catch let error as EncodingError {
            throw BKJSONEncodableError.encoding(error)
        }
        catch let error as BKJSONEncodableError {
            throw error
        }
        catch let error {
            throw BKJSONEncodableError.other(error)
        }
    }
}
