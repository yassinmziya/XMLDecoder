//
//  Data+Utils.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

extension Data {
    
    static var testJSON: Data? {
        if let path = Bundle.main.path(forResource: "test_data", ofType: "json") {
            return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        }
        
        return nil
    }
    
    static var testXML: Data? {
        if let path = Bundle.main.path(forResource: "test_data", ofType: "xml") {
            return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        }
        
        return nil
    }
}
