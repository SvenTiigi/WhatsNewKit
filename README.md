<br/>

<p align="center">
    <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/logo.png" width="30%" alt="logo">
</p>

<h1 align="center">
    WhatsNewKit
</h1>

<p align="center">
    A Swift Package to easily showcase your new app features.
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

<img align="right" width="320" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/example.png" alt="Example">

```swift
import SwiftUI
import WhatsNewKit

struct ContentView: View {

  @State
  var whatsNew = WhatsNew(
    title: "What's New",
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

- [x] Easily present your new App features
- [x] Design and layout like a native App from Apple

## Example

Check out the example application to see WhatsNewKit in action. Simply open the `Example/Example.xcodeproj` and run the "Example" scheme.

<p align="center">
    <img width="85%" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/example-app.png" alt="Example Application">
</p>

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

In general there are two ways to present a `WhatsNewView` automatically or manually.

### Manual Presentation

To manually present a `WhatsNewView` simply initialize a `WhatsNew` instance attributed with a `@State` property wrapper and add a `sheet(whatsNew:)` modifier to your view.

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

The automatic way of presenting a `WhatsNewView` allows you to simply specify the available `WhatsNew` components per versions and WhatsNewKit will take care to present the corresponding `WhatsNew` for the current version of your app.

First you need to configure the `WhatsNewEnvironment` via the `environment` modifier of your root view.
The `WhatsNewEnvironment` allows you to specify the `WhatsNewVersionStore` instance which should be used to store the presented versions and the available `WhatsNew` instances for each version.

```swift
struct App: SwiftUI.App {

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(
                \.whatsNew,
                WhatsNewEnvironment(
                    versionStore: UserDefaultsWhatsNewVersionStore()
                    whatsNewProvider: self
                )
            )
        }
    }

}
```

Next add the conformance to the `WhatsNewCollectionProvider` and specify the various `WhatsNew` elements for each version.

```swift
extension App: WhatsNewCollectionProvider {

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

Lastly add a `whatsNewSheet` modifier to a view where the `WhatsNewView` should be presented.

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
