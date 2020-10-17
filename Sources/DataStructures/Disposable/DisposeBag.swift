//
//  DisposeBag.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.09.20.
//  Copyright © 2020 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - DisposeBag

/// A DisposeBag
final class DisposeBag {
    
    // MARK: Properties
    
    /// The Disposables
    private var disposables: [Disposable]
    
    // MARK: Initializer
    
    /// Designated Initializer
    /// - Parameter disposables: The Disposables. Default vaue `.init()`
    init(disposables: [Disposable] = .init()) {
        self.disposables = disposables
    }

}

// MARK: - Disposable

extension DisposeBag: Disposable {
    
    /// Dispose
    func dispose() {
        self.disposables.forEach { $0.dispose() }
        self.disposables.removeAll()
    }
    
}

// MARK: - Store

extension DisposeBag {
    
    /// Store a given Disposable
    /// - Parameter disposable: The Disposable that should be stored
    func store(_ disposable: Disposable) {
        self.disposables.append(disposable)
    }
    
}
