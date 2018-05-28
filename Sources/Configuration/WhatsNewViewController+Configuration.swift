//
//  WhatsNewViewController+Configuration.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - Configuration

public extension WhatsNewViewController {
    
    /// The WhatsNewViewController Configuration
    struct Configuration: Equatable {
        
        /// The Theme
        public var theme: Theme
        
        /// The optional DetailButton
        public var detailButton: DetailButton?
        
        /// The CompletionButton
        public var completionButton: CompletionButton
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - theme: The Theme. Default value `.default`
        ///   - detailButton: The optional DetailButton
        ///   - completionButton: The CompletionButton
        public init(theme: Theme = .default,
                    detailButton: DetailButton? = nil,
                    completionButton: CompletionButton = .init()) {
            self.theme = theme
            self.detailButton = detailButton
            self.completionButton = completionButton
        }
        
    }
    
}
