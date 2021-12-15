<br/>

<p align="center">
    <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/logo.png" width="30%" alt="logo">
</p>

<h1 align="center">
    WhatsNewKit
</h1>

<p align="center">
    A Swift Package to easily showcase your awesome new app features.
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

```swift
import SwiftUI
import WhatsNewKit

struct ContentView: View {

    @WhatsNewState
    var whatsNew = WhatsNew(
        version: "1.0.0",
        title: "What's New",
        features: [
            .init(
                image: .init(systemName: "star.fill"),
                title: "New Design",
                subtitle: "An awesome new design"
            )
        ]
    )
    
    var body: some View {
        List {
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

`t.b.d`

## Advanced

`t.b.d`

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
