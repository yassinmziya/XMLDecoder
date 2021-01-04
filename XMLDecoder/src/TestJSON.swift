//
//  TestJSON.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

struct TestJSON: Codable {
    
    let random: Int
    let bool: Bool
    let regEx: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        random = try container.decode(Int.self, forKey: .random)
        bool = try container.decode(Bool.self, forKey: .bool)
        regEx = try container.decode(String.self, forKey: .regEx)
    }
    
    enum CodingKeys: CodingKey {
        case random, bool, regEx
    }
}
