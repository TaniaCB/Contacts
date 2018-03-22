//
//  PlistLoader.swift
//  Color Contacts
//
//  Created by Tania on 22/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

enum PlistError: Error {
    case invalidResource
    case parsingFailure
}

class PlistLoader {
    static func array(fromFile name: String, ofType type: String) throws -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw PlistError.invalidResource
        }
        
        guard let array = NSArray(contentsOfFile: path) as? [[String: String]] else {
            throw PlistError.parsingFailure
        }
        
        return array
    }
}

class ContactsSource {
    static var contacts: [Contact] {
        let data = try! PlistLoader.array(fromFile: "Contacts", ofType: "plist")
        return data.flatMap { Contact(dictionary: $0) }
    }
    
}
