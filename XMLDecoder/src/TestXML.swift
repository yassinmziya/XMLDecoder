//
//  TestXML.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

struct TestXML: Codable {
    let key: Key
    let nearest: Float
    let state: State
}

struct RootXMLNode: Codable {
    let root: TestXML
}


struct Key: Codable {
    let attr: Int
    let key: String
    
    enum CodingKeys: String, CodingKey {
        case attr
        case key = ""
    }
}
struct State: Codable {
    let hasState: Bool
    
    enum CodingKeys: String, CodingKey {
        case hasState = "has_state"
    }
}
