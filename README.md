<br/>

<p align="center">
    <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/logo.png" width="30%" alt="logo">
</p>

<h1 align="center">
    WhatsNewKit
</h1>

<p align="center">
    WhatsNewKit enables you to easily showcase your awesome new app features.
    <br/>
    It's designed from the ground up to be fully customized to your needs.
</p>

<p align="center">
   <a href="https://github.com/SvenTiigi/WhatsNewKit/actions?query=workflow%3ACI">
      <img src="https://github.com/SvenTiigi/WhatsNewKit/workflows/CI/badge.svg" alt="CI Status">
   </a>
   <a href="https://sventiigi.github.io/WhatsNewKit">
      <img src="https://github.com/SvenTiigi/WhatsNewKit/blob/gh-pages/badge.svg" alt="Documentation">
   </a>
   <img src="https://img.shields.io/badge/platform-iOS-F05138" alt="Platform">
   <a href="https://twitter.com/SvenTiigi/">
      <img src="https://img.shields.io/badge/Twitter-@SvenTiigi-blue.svg?style=flat" alt="Twitter">
   </a>
</p>

<img align="right" width="325" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/example.png" alt="Example">

```swift
import SwiftUI
import WhatsNewKit

struct ContentView: View {

  @State
  var whatsNew = WhatsNew(
    title: "WhatsNewKit",
    features: [
      .init(
        image: .init(
          systemName: "star.fill", 
          tintColor: .systemOrange
        ),
        title: "Showcase your new App Features",
        subtitle: "Present your new app features..."
      ),
      // ...
    ]
  )
    
  var body: some View {
    NavigationView {
      // ...
    }
    .sheet(
      whatsNew: self.$whatsNew
    )
  }
    
}
```

## Features

- [x] Easily present your new app features 🤩
- [x] Automatic/Manual presentation mode ✅
- [x] Support for SwiftUI and UIKit 🧑‍🎨
- [x] Adjustable layout 🔧

## Example

Check out the example application to see WhatsNewKit in action. Simply open the `Example/Example.xcodeproj` and run the "Example" scheme.

## Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/SvenTiigi/WhatsNewKit.git", from: "2.0.0")
]
```

Or navigate to your Xcode project then select `Swift Packages`, click the “+” icon and search for `WhatsNewKit`.

## Usage

<p align="center">
    <img width="90%" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/example-app.png" alt="Example Applications">
</p>

### Manual Presentation

If you wish to manually present a `WhatsNewView` you can make use of the `sheet(whatsNew:)` modifier.

```swift
struct ContentView: View {

    @State
    var whatsNew: WhatsNew = // ...
    
    var body: some View {
        NavigationView {
            // ...
        }
        .sheet(
            whatsNew: self.$whatsNew
        )
    }
    
}
```

### Automatic Presentation

Beside manually presenting a WhatsNewView you can make use of the automatic presentation which allows you to simply declare your new features for each version.

To enable the automatic presentation simply configure the `WhatsNewEnvironment` via the `environment` modifier.

A `WhatsNewEnvironment` takes in the following two parameters:

- `versionStore`: A WhatsNewVersionStore which is used to save the versions that have been presented to the user.
- `whatsNew`: A WhatsNewCollectionProvider which provides a WhatsNew instance for a specific version.

```swift
struct App: SwiftUI.App {

    // A WhatsNewEnvironment
    // Saves presented versions in the UserDefaults
    // WhatsNew instances are provided by a `WhatsNewCollectionProvider`
    let whatsNewEnvironment = WhatsNewEnvironment(
        versionStore: UserDefaultsWhatsNewVersionStore()
        whatsNew: self
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.whatsNew, self.whatsNewEnvironment)
        }
    }

}

extension App: WhatsNewCollectionProvider {

    /// A WhatsNewCollection
    var whatsNewCollection: WhatsNewCollection {
        WhatsNew(
            version: "1.0.0",
            // ...
        )
        WhatsNew(
            version: "1.1.0",
            // ...
        )
        WhatsNew(
            version: "1.2.0",
            // ...
        )
    }

}
```

After configuring the `WhatsNewEnvironment` simply add a `whatsNewSheet()` modifier to a view where the `WhatsNewView` should be presented.

```swift
struct ContentView: View {

    var body: some View {
        NavigationView {
            // ...
        }
        .whatsNewSheet()
    }

}
```

## WhatsNewVersionStore

A `WhatsNewVersionStore` is a protocol type which is responsible for saving versions that have been presented to the user as well as returning the already presented versions.

WhatsNewKit comes along with three predefined implementations:

- `UserDefaultsWhatsNewVersionStore`: Persists versions in the UserDefaults
- `NSUbiquitousKeyValueWhatsNewVersionStore`: Persists versions in iCloud
- `InMemoryWhatsNewVersionStore`: Stores versions in memory (Perfect for testing purposes)

If you already have a specific implementation to store user related settings like Realm or Core Data you can easily adopt your existing implementation to the `WhatsNewVersionStore`.

## WhatsNew

The following sections explains how a `WhatsNew` struct can be initialized in order to describe the new features for a given version of your app.

```swift
let whatsnew = WhatsNew(
    version: "1.0.0",
    title: "What's New",
    features: [
        WhatsNew.Feature(
            image: .init(systemName: "star.fill"),
            title: "Title",
            subtitle: "Subtitle"
        )
    ],
    primaryAction: WhatsNew.PrimaryAction(
        title: "Continue",
        backgroundColor: .accentColor,
        foregroundColor: .white,
        hapticFeedback: .notification(.success),
        onDimiss: {
            print("Primary Action was tapped")
        }
    ),
    secondaryAction: WhatsNew.SecondaryAction(
        title: "Learn more",
        foregroundColor: .accentColor,
        hapticFeedback: .selection,
        action: .openURL(
            .init(string: "https://github.com/SvenTiigi/WhatsNewKit")
        )
    )
)
```

### WhatsNew.Version

The `WhatsNew.Version` specifies the version that has introduced certain features to your app.

```swift
// Initialize with major, minor, and patch
let version = WhatsNew.Version(
    major: 1, 
    minor: 0, 
    patch: 0
)

// Initialize by string literal
let version: WhatsNew.Version = "1.0.0"

// Initialize WhatsNew Version by using the current version of your bundle
let version: WhatsNew.Version = .current()
```

### WhatsNew.Title

A `WhatsNew.Title` represents the title text that is rendered above the features.

```swift
// Initialize by string literla
let title: WhatsNew.Title = "Continue"

// Initialize with text and foreground color
let title = WhatsNew.Title(
    text: "Continue",
    foregroundColor: .primary
)

// On >= iOS 15 initialize with AttributedString using Markdown
let title = WhatsNew.Title(
    text: try AttributedString(
        markdown: "What's **New**"
    )
)
```

### WhatsNew.Feature

A `WhatsNew.Feature` describe a specific feature of your app and generally consist of an image, title, and subtitle.

```swift
let feature = WhatsNew.Feature(
    image: .init(
        uiImage: UIImage(named: "DesignIcon")
    ),
    title: "New Design",
    subtitle: .init(
        try AttributedString(
            markdown: "An awesome new _Design_"
        )
    )
)
```

### WhatsNew.PrimaryAction

The `WhatsNew.PrimaryAction` allows you to configure the behaviour of the primary button which is used to dismiss the presented `WhatsNewView`

```swift
let primaryAction = WhatsNew.PrimaryAction(
    title: "Continue",
    backgroundColor: .blue,
    foregroundColor: .white,
    hapticFeedback: .notification(.success),
    onDismiss: {
        print("WhatsNew dismissed")
    }   
)
```

### WhatsNew.SecondaryAction

A `WhatsNew.SecondaryAction` which is displayed above the `WhatsNew.PrimaryAction` can be optionally supplied when initializing a `WhatsNew` instance and allows you to either present an additional View or open a URL.

```swift
let secondaryActionPresentAboutView = WhatsNew.SecondaryAction(
    title: "Learn more",
    foregroundColor: .blue,
    hapticFeedback: .selection,
    action: .present {
        AboutView()
    }  
)

let secondaryActionOpenURL = WhatsNew.SecondaryAction(
    title: "Read more",
    foregroundColor: .blue,
    hapticFeedback: .selection,
    action: .open(
        url: .init(string: "https://github.com/SvenTiigi/WhatsNewKit")
    )  
)
```

## Layout

WhatsNewKit allows you to adjust the layout of a presented `WhatsNewView` in various ways.

The most simple way is by mutating the `default` WhatsNewView Layout instance.

```swift
WhatsNewView.Layout.default.featureListSpacing = 35
```

When using the automatic presentation style you can supply a default WhatsNewView Layout when initializing the WhatsNewEnvironment.

```swift
.environment(
    \.whatsNew,
    .init(
        defaultLayout: .init(
            showsScrollViewIndicators: true,
            featureListSpacing: 35
        ),
        whatsNew: self
    )
)
```

Alternatively you can pass a `WhatsNewView.Layout` when presenting the WhatsNewView

```swift
.sheet(
    whatsNew: self.$whatsNew,
    layout: .init(
        footerActionSpacing: 20
    )
)

.whatsNewSheet(
    layout: .init(
        contentPadding: .init(
            top: 80, 
            leading: 0,
            bottom: 0,
            trailing: 0
        )
    )
)
```

## WhatsNewViewController

When using `UIKit` you can make use of the `WhatsNewViewController`.

```swift
let whatsNewViewController = WhatsNewViewController(
    whatsNew: WhatsNew(
        version: "1.0.0",
        // ...
    ),
    layout: WhatsNewView.Layout(
        contentSpacing: 80
    )
)
```

If you wish to present a `WhatsNewViewController` only if the version of the WhatsNew instance has not been presented you can make use of the convenience failable initializer.

```swift
// Verify WhatsNewViewController is available for presentation
guard let whatsNewViewController = WhatsNewViewController(
    whatsNew: WhatsNew(
        version: "1.0.0",
        // ...
    ),
    versionStore: UserDefaultsWhatsNewVersionStore()
) else {
    // Version of WhatsNew has already been presented
    return
}

// Present WhatsNewViewController
// Version will be automatically saved in the provided
// WhatsNewVersionStore when the WhatsNewViewController gets dismissed
self.present(whatsNewViewController, animated: true)
```

## License

```
WhatsNewKit
Copyright (c) 2021 Sven Tiigi sven.tiigi@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
