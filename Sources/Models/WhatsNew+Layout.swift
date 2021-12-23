import SwiftUI

// MARK: - WhatsNew+Layout

public extension WhatsNew {
    
    /// The WhatsNew Layout
    struct Layout {
        
        // MARK: Properties

        /// A Boolean value if the scroll view indicator should be visible
        public var showsScrollViewIndicators: Bool
        
        /// The scroll view bottom content inset
        public var scrollViewBottomContentInset: CGFloat
        
        /// The content spacing
        public var contentSpacing: CGFloat
        
        /// The content padding
        public var contentPadding: EdgeInsets
        
        /// The feature list spacing
        public var featureListSpacing: CGFloat
        
        /// The feature list padding
        public var featureListPadding: EdgeInsets
        
        /// The feature image width
        public var featureImageWidth: CGFloat
        
        /// The feature horizontal spacing
        public var featureHorizontalSpacing: CGFloat
        
        /// The feature vertical spacing
        public var featureVerticalSpacing: CGFloat
        
        /// The footer action spacing
        public var footerActionSpacing: CGFloat
        
        /// The corner radius of the primary action button
        public var footerPrimaryActionButtonCornerRadius: CGFloat
        
        /// The footer visual effect view padding
        public var footerVisualEffectViewPadding: EdgeInsets
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Layout`
        /// - Parameters:
        ///   - showsScrollViewIndicators: A Boolean value if the scroll view indicator should be visible. Default value `false`
        ///   - scrollViewBottomContentInset: The scroll view bottom content inset. Default value `150`
        ///   - contentSpacing: The content spacing. Default value `60`
        ///   - contentPadding: The content padding. Default value `top: 65`
        ///   - featureListSpacing: The feature list spacing. Default value `25`
        ///   - featureListPadding: The feature list padding. Default value `leading: 15`
        ///   - featureImageWidth: The feature image width. Default value `40`
        ///   - featureHorizontalSpacing: The feature horizontal spacing. Default value `15`
        ///   - featureVerticalSpacing: The feature vertical spacing. Default value `2`
        ///   - footerActionSpacing: The footer action spacing. Default value `15`
        ///   - footerPrimaryActionButtonCornerRadius: The corner radius of the primary action button. Default value `14`
        ///   - footerVisualEffectViewPadding: The footer visual effect view padding. Default value `top: -10`
        public init(
            showsScrollViewIndicators: Bool = false,
            scrollViewBottomContentInset: CGFloat = 150,
            contentSpacing: CGFloat = 60,
            contentPadding: EdgeInsets = .init(top: 65, leading: 0, bottom: 0, trailing: 0),
            featureListSpacing: CGFloat = 25,
            featureListPadding: EdgeInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 0),
            featureImageWidth: CGFloat = 40,
            featureHorizontalSpacing: CGFloat = 15,
            featureVerticalSpacing: CGFloat = 2,
            footerActionSpacing: CGFloat = 15,
            footerPrimaryActionButtonCornerRadius: CGFloat = 14,
            footerVisualEffectViewPadding: EdgeInsets = .init(top: -10, leading: 0, bottom: 0, trailing: 0)
        ) {
            self.showsScrollViewIndicators = showsScrollViewIndicators
            self.scrollViewBottomContentInset = scrollViewBottomContentInset
            self.contentSpacing = contentSpacing
            self.contentPadding = contentPadding
            self.featureListSpacing = featureListSpacing
            self.featureListPadding = featureListPadding
            self.featureImageWidth = featureImageWidth
            self.featureHorizontalSpacing = featureHorizontalSpacing
            self.featureVerticalSpacing = featureVerticalSpacing
            self.footerActionSpacing = footerActionSpacing
            self.footerPrimaryActionButtonCornerRadius = footerPrimaryActionButtonCornerRadius
            self.footerVisualEffectViewPadding = footerVisualEffectViewPadding
        }
        
    }
    
}

// MARK: - Layout+default

public extension WhatsNew.Layout {
    
    /// The mutable default Layout
    static var `default` = Self()
    
}

// MARK: - Layout+reset

public extension WhatsNew.Layout {
    
    /// Reset the Layout to default values
    mutating func reset() {
        self = .init()
    }
    
}
