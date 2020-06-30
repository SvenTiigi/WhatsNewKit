//
//  WhatsNewView.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 30.06.20.
//  Copyright © 2020 WhatsNewKit. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

/// The WhatsNew SwiftUI View
@available(iOS 13.0, *)
public struct WhatsNewView: SwiftUI.View {
    
    // MARK: Typealias
    
    /// The Configuration typealias
    public typealias Configuration = WhatsNewViewController.Configuration
    
    /// The Theme typealias
    public typealias Theme = WhatsNewViewController.Theme
    
    // MARK: Properties
    
    /// The WhatsNew ViewControllerRepresentable
    private let whatsNewViewControllerRepresentable: ViewControllerRepresentable
    
    // MARK: Initializer
    
    /// Designated Initializer with WhatsNew and Configuration
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - configuration: The Configuration. Default value `.init()`
    public init(
        whatsNew: WhatsNew,
        configuration: Configuration = .init()
    ) {
        self.whatsNewViewControllerRepresentable = .init(
            viewController: WhatsNewViewController(
                whatsNew: whatsNew,
                configuration: configuration
            )
        )
    }
    
    /// Convenience optional initializer with WhatsNewVersionStore.
    /// Initializer checks via WhatsNewVersionStore if Version has already been presented.
    /// If a Version has been found the initializer will return nil.
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - configuration: The Configuration
    ///   - versionStore: The WhatsNewVersionStore
    public init?(
        whatsNew: WhatsNew,
        configuration: Configuration = .init(),
        versionStore: WhatsNewVersionStore
    ) {
        // Verify VersionStore has not stored the WhatsNew Version
        guard !versionStore.has(version: whatsNew.version) else {
            // Return nil as Version has already been presented
            return nil
        }
        self.init(
            whatsNew: whatsNew,
            configuration: configuration
        )
    }
    
    /// Convenience Initializer with WhatsNew and a Theme
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - theme: The Theme
    public init(
        whatsNew: WhatsNew,
        theme: Theme
    ) {
        self.init(
            whatsNew: whatsNew,
            configuration: .init(theme)
        )
    }
    
    /// Convenience Initializer with WhatsNew, Theme and WhatsNewVersionStore
    /// Initializer checks via WhatsNewVersionStore if Version has already been presented.
    /// If a Version has been found the initializer will return nil.
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - theme: The Theme
    public init?(
        whatsNew: WhatsNew,
        theme: Theme,
        versionStore: WhatsNewVersionStore
    ) {
        self.init(
            whatsNew: whatsNew,
            configuration: .init(theme),
            versionStore: versionStore
        )
    }
    
    // MARK: View
    
    /// The type of view representing the body of this view.
    public var body: some SwiftUI.View {
        self.whatsNewViewControllerRepresentable
    }
    
}

// MARK: - ViewControllerRepresentable

/// The ViewControllerRepresentable
private struct ViewControllerRepresentable: SwiftUI.UIViewControllerRepresentable {
    
    // MARK: Properties
    
    /// The UIViewController
    let viewController: UIViewController
    
    // MARK: UIViewControllerRepresentable
    
    /// Creates a `UIViewController` instance to be presented.
    /// - Parameter context: The Context
    func makeUIViewController(context: Context) -> UIViewController {
        self.viewController
    }
    
    /// Updates the presented `UIViewController` (and coordinator) to the latest configuration.
    /// - Parameters:
    ///   - uiViewController: The UIViewController
    ///   - context: The Context
    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: Context
    ) {}
    
}

// MARK: - WhatsNewViewPreviewProvider

#if DEBUG
/// The WhatsNewView PreviewProvider
@available(iOS 13.0, *)
struct WhatsNewView_Previews: PreviewProvider {
    
    struct SheetPreviewView: SwiftUI.View {
        
        let whatsNew: WhatsNew
        
        @State
        var showingWhatsNew = false
        
        var body: some View {
            Button(
                action: { self.showingWhatsNew.toggle() },
                label: { Text("Show WhatsNewView") }
            ).sheet(isPresented: self.$showingWhatsNew) {
                WhatsNewView(
                    whatsNew: self.whatsNew
                )
            }
        }
        
    }
    
    /// Generates a collection of previews.
    static var previews: some View {
        let whatsNew = WhatsNew(
            title: "WhatsNewKit",
            items: [
                .init(
                    title: "Awesome Feature #1",
                    subtitle: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
                    image: UIImage(systemName: "star.fill")
                ),
                .init(
                    title: "Awesome Feature #2",
                    subtitle: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
                    image: UIImage(systemName: "hammer.fill")
                ),
                .init(
                    title: "Awesome Feature #2",
                    subtitle: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
                    image: UIImage(systemName: "map.fill")
                )
            ]
        )
        return Group {
            WhatsNewView(whatsNew: whatsNew)
                .environment(\.colorScheme, .light)
            WhatsNewView(whatsNew: whatsNew)
                .environment(\.colorScheme, .dark)
            SheetPreviewView(whatsNew: whatsNew)
        }
    }
    
}
#endif

#endif
