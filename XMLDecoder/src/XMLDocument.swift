//
//  XMLDocument.swift
//  XMLDecoder
//
//  Created by Yassin Mziya on 12/31/20.
//

import Foundation

// MARK: - XMLElement

/// XMLElement
class XMLElement {
    var name: String
    var value: String?
    var children: [XMLElement] = []
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

// MARK: - XMLDocument

/// XMLDocument
class XMLDocument: NSObject {
    
    var rootElement: XMLElement?
    private var stack: [XMLElement] = []
    
    init(from data: Data) {
        super.init()
        
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
}

// MARK: - XMLParserDelegate

extension XMLDocument: XMLParserDelegate {

    func parserDidStartDocument(_ parser: XMLParser) {
        print("start")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("end")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // NOTE: Basically DFS
        let element = XMLElement(name: elementName)
        guard rootElement != nil else {
            // Populate root element and stack upon parsing first element
            stack.append(element)
            rootElement = stack.first
            return
        }
        
        // Update children of element at to of stack and push new element
        stack.last?.children.append(element)
        stack.append(element)
        
        // NOTES: We treat attributes as children of their respective element
        guard !attributeDict.isEmpty else { return }
        attributeDict.forEach {  element.children.append(XMLElement(name: $0, value: $1)) }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let string = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !string.isEmpty else { return }
        
        stack.last?.value = string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        _ = stack.popLast()
    }
    
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
    }
}

