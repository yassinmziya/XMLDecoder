//
//  XMLDecoder.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

class XMLDecoder: NSObject {
    
    var elements: [XMLElement] = []
    
    // MARK: Public Interface
    
    func decode<T>(_ type: T.Type, data: Data) throws -> T where T: Decodable {
        let decoded: T
        do {
            let xmlDocument = XMLDocument(from: data)
            elements.append(xmlDocument.rootElement!)
            decoded = try type.init(from: self)
        } catch {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "This value was not valid xml", underlyingError: error))
        }
        
        return decoded
    }
    
    // MARK: Decoder
    
    var codingPath = [CodingKey]()
    
    var userInfo = [CodingUserInfoKey : Any]()
}

// MARK: - Decoder

extension XMLDecoder: Decoder {
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        guard let topLevelElement = elements.last else {
            fatalError()
        }
        
        return KeyedDecodingContainer(XMLKeyedDecodingContainer(decoder: self, xmlElement: topLevelElement))
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        fatalError()
    }
}


