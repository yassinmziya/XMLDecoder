//
//  ViewController.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        do {
//            let jsonDecoder = JSONDecoder()
//            let decodedJSON = try jsonDecoder.decode(TestJSON.self, from: Data.testJSON!)
//        } catch {
//            print(error)
//        }
        
        do {
            let testData = Data.testXML!
            let xmlDocument = XMLDocument(from: testData)
            
            let xmlDecoder = XMLDecoder()
            let decodedXML = try xmlDecoder.decode(TestXML.self, data: Data.testXML!)
            print(decodedXML)
        } catch {
            print(error)
        }
    }
}

