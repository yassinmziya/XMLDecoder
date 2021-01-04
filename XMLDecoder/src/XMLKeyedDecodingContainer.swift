//
//  XMLKeyedDecodingContainer.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

struct XMLKeyedDecodingContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
    
    var codingPath = [CodingKey]()
    
    var allKeys = [Key]()
    
    let decoder: XMLDecoder
    
    let xmlElement: XMLElement
    
    func contains(_ key: Key) -> Bool {
        fatalError()
    }
    
    func decodeNil(forKey key: Key) throws -> Bool {
        fatalError()
    }
    
    func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        guard let child = findChild(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key) (\"\(key.stringValue)\")."))
        }
        
        guard let value = child.value, let decoded = Bool(value) else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath:codingPath, debugDescription: "Expected \(type) value but found null instead."))
        }
        
        return decoded
    }
    
    func decode(_ type: String.Type, forKey key: Key) throws -> String {
        guard let child = findChild(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key) (\"\(key.stringValue)\")."))
        }
        
        guard let value = child.value else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath:codingPath, debugDescription: "Expected \(type) value but found null instead."))
        }
        
        return value
    }
    
    func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        fatalError()
    }
    
    func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        guard let child = findChild(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key) (\"\(key.stringValue)\")."))
        }
        
        guard let value = child.value, let decoded = Float(value) else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath:codingPath, debugDescription: "Expected \(type) value but found null instead."))
        }
        
        return decoded
    }
    
    func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        guard let child = findChild(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key) (\"\(key.stringValue)\")."))
        }
        
        guard let value = child.value, let decoded = Int(value) else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath:codingPath, debugDescription: "Expected \(type) value but found null instead."))
        }
        
        return decoded
    }
    
    func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        fatalError()
    }
    
    func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        fatalError()
    }
    
    func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        fatalError()
    }
    
    func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        fatalError()
    }
    
    func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        fatalError()
    }
    
    func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        fatalError()
    }
    
    func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        fatalError()
    }
    
    func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        fatalError()
    }
    
    func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        fatalError()
    }
    
    func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
        guard let child = findChild(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key) (\"\(key.stringValue)\")."))
        }
        
        decoder.elements.append(child)
        let value = try type.init(from: decoder)
        decoder.elements.popLast()
        
        return value
    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }
    
    func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    func superDecoder() throws -> Decoder {
        fatalError()
    }
    
    func superDecoder(forKey key: Key) throws -> Decoder {
        fatalError()
    }
}

private extension XMLKeyedDecodingContainer {
    
    func findChild(for key: Key) -> XMLElement? {
        if key.stringValue.isEmpty {
            return xmlElement
        }
        return xmlElement.children.first(where: { $0.name == key.stringValue }).flatMap( { $0 } )
    }
    
}
