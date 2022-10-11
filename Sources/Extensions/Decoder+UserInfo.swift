//
//  Decoder+UserInfo.swift
//  
//
//  Created by Christian Beer on 21.09.22.
//

import Foundation

extension Dictionary where Key == CodingUserInfoKey, Value == Any {
    
    subscript(key: String) -> WhatsNew.Feature.Image? {
        get {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return nil }
            return self[codingKey] as? WhatsNew.Feature.Image
        }
        set {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return }
            return self[codingKey] = newValue
        }
    }
    
    subscript(key: String) -> WhatsNew.PrimaryAction? {
        get {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return nil }
            return self[codingKey] as? WhatsNew.PrimaryAction
        }
        set {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return }
            return self[codingKey] = newValue
        }
    }
    
    subscript(key: String) -> WhatsNew.SecondaryAction? {
        get {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return nil }
            return self[codingKey] as? WhatsNew.SecondaryAction
        }
        set {
            guard let codingKey = CodingUserInfoKey(rawValue: key) else { return }
            return self[codingKey] = newValue
        }
    }
    
}
