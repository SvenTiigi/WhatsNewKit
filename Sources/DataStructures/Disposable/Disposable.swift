//
//  Disposable.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.09.20.
//  Copyright © 2020 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - Disposable

/// A Diposable Type
protocol Disposable {
    
    /// Dispose
    func dispose()
    
}

// MARK: - Store In

extension Disposable {
    
    /// Store the Disposable in a given DisposeBag
    /// - Parameter disposeBag: The DisposeBag where the Disposable should be stored in
    /// - Returns: The Disposable
    @discardableResult
    func store(in disposeBag: DisposeBag) -> Disposable {
        // Append Disposable to DisposeBag
        disposeBag.store(self)
        // Return Disposable
        return self
    }
    
}

// MARK: - ClosureDisposable

/// A ClosureDisposable
struct ClosureDisposable: Disposable {
    
    // MARK: Properties
    
    /// The dispose closure
    private let closure: () -> Void
    
    // MARK: Initializer
    
    /// Designated Initializer
    /// - Parameter closure: The dispose closure
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    // MARK: Disposable
    
    /// Dispose
    func dispose() {
        self.closure()
    }
    
}
