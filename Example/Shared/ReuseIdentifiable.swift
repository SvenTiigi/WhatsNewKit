//
//  ReuseIdentifiable.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - ReuseIdentifiable

/// The ReuseIdentifiable
protocol ReuseIdentifiable {
    
    /// The reuse Identifier
    static var reuseIdentifier: String { get }
    
}

// MARK: - ReuseIdentifiable Default Implementation

extension ReuseIdentifiable {
    
    /// The reuse Identifier
    static var reuseIdentifier: String {
        // Return SubjectType of self as String
        return String(describing: Mirror(reflecting: self).subjectType)
    }
    
}
