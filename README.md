<p align="center">
   <img width="300" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewKitLogo.png" alt="WhatsNewKit Header Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="https://travis-ci.com/SvenTiigi/WhatsNewKit">
      <img src="https://travis-ci.com/SvenTiigi/WhatsNewKit.svg?branch=master" alt="Build Status">
   </a>
   <a href="http://cocoapods.org/pods/WhatsNewKit">
      <img src="https://img.shields.io/cocoapods/v/WhatsNewKit.svg?style=flat" alt="Version">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="http://cocoapods.org/pods/WhatsNewKit">
      <img src="https://img.shields.io/cocoapods/p/WhatsNewKit.svg?style=flat" alt="Platform">
   </a>
   <br/>
   <a href="https://codeclimate.com/github/SvenTiigi/WhatsNewKit/maintainability">
      <img src="https://api.codeclimate.com/v1/badges/e1a0a92affd3c0d0f402/maintainability" />
   </a>
   <a href="https://sventiigi.github.io/WhatsNewKit">
      <img src="https://github.com/SvenTiigi/WhatsNewKit/blob/gh-pages/badge.svg" alt="Documentation">
   </a>
   <a href="https://twitter.com/SvenTiigi/">
      <img src="https://img.shields.io/badge/Twitter-@SvenTiigi-blue.svg?style=flat" alt="Twitter">
   </a>
</p>

<br/>

<p align="center">
   WhatsNewKit enables you to easily showcase your awesome new app features. <br/> It's designed from the ground up to be fully customized to your needs.
</p>

<br/>

<p align="center">
   <img width="600" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewKit.gif" alt="Demo">
</p>

## Features

- [x] Customization and Configuration to your needs 💪
- [x] Predefined Themes and Animations 🎬
- [x] Easily check if your Features have already been presented 🎁
- [x] Awesome UI 😍

## Example

The example Application is an excellent way to see `WhatsNewKit` in action. You get a brief look of the available configuration options and how they affect the look and feel of the `WhatsNewViewController`. Simply open the `WhatsNewKit.xcodeproj` and run the `WhatsNewKit-Example` scheme.

<p align="center">
<img width="80%" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/ExampleApp.png" alt="Example App">
</p>

## Installation

### CocoaPods

WhatsNewKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'WhatsNewKit'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate WhatsNewKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "SvenTiigi/WhatsNewKit"
```

Run `carthage update --platform iOS` to build the framework and drag the built `WhatsNewKit.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/SvenTiigi/WhatsNewKit.git", from: "1.2.0")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate WhatsNewKit into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage
The following first usage description shows the easiest way of presenting your new app features with `WhatsNewKit`.

> 👨‍💻 Please see the [Advanced](https://github.com/SvenTiigi/WhatsNewKit#advanced) section for further configuration options and features.

```swift
import WhatsNewKit

// Initialize WhatsNew
let whatsNew = WhatsNew(
    // The Title
    title: "WhatsNewKit",
    // The features you want to showcase
    items: [
        WhatsNew.Item(
            title: "Installation",
            subtitle: "You can install WhatsNewKit via CocoaPods or Carthage",
            image: UIImage(named: "installation")
        ),
        WhatsNew.Item(
            title: "Open Source",
            subtitle: "Contributions are very welcome 👨‍💻",
            image: UIImage(named: "openSource")
        )
    ]
)

// Initialize WhatsNewViewController with WhatsNew
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew
)

// Present it 🤩
self.present(whatsNewViewController, animated: true)
```

## Advanced
As mentioned before `WhatsNewKit` can be fully customized to your needs. The Advanced section will explain all configuration possibilities and features of `WhatsNewKit` in detail. First off it's important to understand the components of the `WhatsNewViewController` in order to customize the behaviour and `UI`-Design.

<p align="center">
<img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/UILayout.gif" alt="UILayout">
</p>

### WhatsNewViewController.Configuration
The [WhatsNewViewController.Configuration](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BConfiguration.swift) struct enables you to customize the `WhatsNewViewController` components to your needs. The configuration itself can be passed to the initializer of the `WhatsNewViewController`.

```swift
// Initialize default Configuration
var configuration = WhatsNewViewController.Configuration()

// Customize Configuration to your needs
configuration.backgroundColor = .white
configuration.titleView.titleColor = .orange
configuration.itemsView.titleFont = .systemFont(ofSize: 17)
configuration.detailButton.titleColor = .orange
configuration.completionButton.backgroundColor = .orange
// And many more configuration properties...

// Initialize WhatsNewViewController with custom configuration
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew, 
    configuration: configuration
)
```

### Theme 🌄
A [Theme](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BConfiguration.swift) allows you to group the customization of a `WhatsNewViewController.Configuration`. `WhatsNewKit` implemented predefined Themes which are available as static properties both in white and dark mode. Or you create your very own Theme to configure it to your needs.

| `.darkRed` | `.whiteRed`   |
| ------------- | ------------- |
| <p align="center"> <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/Theme_darkRed.jpg" width="70%" alt="Theme Dark Red"/> </p> | <p align="center"> <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/Theme_whiteRed.jpg" width="70%" alt="Theme White Red" /> </p>|

```swift
// Configuration with predefined Dark Red Theme
let darkRed = WhatsNewViewController.Configuration(
    theme: .darkRed
)

// Apply predefined White Red Theme to Configuration
var configuration = WhatsNewViewController.Configuration()
configuration.apply(theme: .whiteRed)

// Or create your own Theme and initialize a Configuration with your Theme
let myTheme = WhatsNewViewController.Theme { configuration in
    configuration.backgroundColor = .white
    configuration.titleView.titleColor = .orange
    configuration.itemsView.titleFont = .systemFont(ofSize: 17)
    configuration.detailButton.titleColor = .orange
    configuration.completionButton.backgroundColor = .orange
    // ...
}

let configuration = WhatsNewViewController.Configuration(
    theme: myTheme
)
```

For a full overview of the available predefined Themes check out the [Example-Application](https://github.com/SvenTiigi/WhatsNewKit/tree/master/Example).

### Layout 📐

`WhatsNewKit` comes with two predefined [`ItemsView.Layouts`](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BItemsView.swift). 

| Default | Centered   |
| ------------- | ------------- |
| <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/LayoutDefault.png" alt="Default Layout" /> | <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/LayoutCentered.png" alt="Centered Layout" /> |
| The `default` layout shows an image on the left side and the text on the right side. | The `centered` layout aligns the image as well as the text in center. |

```swift
// Default Layout
configuration.itemsView.layout = .default

// Centered Layout
configuration.itemsView.layout = .centered
```
> ☝️ In default the ItemsView layout is set to `default`.

### ContentMode 📏

Setting the [`ContentMode`](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BItemsView.swift) in the `ItemsView` Configuration will adjust for how your features are arranged along the axis.

| Top | Center | Fill |
| ------------- | ------------- | ------------- |
| <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/ContentMode_Top.jpg" alt="ContentMode Top" /> | <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/ContentMode_Center.jpg" alt="ContentMode Center" /> | <img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/ContentMode_Fill.jpg" alt="ContentMode Fill" />

```swift
// ContentMode Top
configuration.itemsView.contentMode = .top

// ContentMode Center
configuration.itemsView.contentMode = .center

// ContentMode Fill
configuration.itemsView.contentMode = .fill
```
> ☝️ In default the ItemsView ContentMode  is set to `top`.

### Insets

Additionally, if you wish you can modify the layout insets of the `WhatsNewViewController` components.

```swift
// Set TitleView Insets (Default values)
configuration.titleView.insets = UIEdgeInsets(top: 50, left: 20, bottom: 15, right: 20)

// Increase the CompletionButton Bottom Inset 
configuration.completionButton.insets.bottom += 10
```

### ImageSize 
In order to define the size of your images for each of your feature you can set an [ImageSize](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BItemsView.swift) on the `ItemsView` configuration.

```swift
// Use the original image size as it is
configuration.itemsView.imageSize = .original

// Use the preferred image size which fits perfectly :)
configuration.itemsView.imageSize = .preferred

// Use a custom height for each image
configuration.itemsView.imageSize = .fixed(height: 25)
```
> ☝️ In default the ItemsView ImageSize  is set to `preferred`.

### Animation 🎬
<img align="right" width="300" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/Animations.gif" alt="Animations" />

You can apply a [Animation](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BAnimation.swift) to all components of the `WhatsNewViewController` via predefined animation types. In default all Animation properties are `nil` indicating no animation should be perfomed.

```swift
// Set SlideUp Animation to TitleView
configuration.titleView.animation = .slideUp

// Set SlideRight Animation to ItemsView
configuration.itemsView.animation = .slideRight

// Set SlideLeft Animation to DetailButton
configuration.detailButton.animation = .slideLeft

// Set SlideDown Animation to CompletionButton
configuration.completionButton.animation = .slideDown
```

If you wish to animate all views with the same type you can do so by simply applying it to the configuration.

```swift
// Global Animation-Type for all WhatsNewViewController components
configuration.apply(animation: .fade)
```

If you wish to define your custom animation, simply set the `custom` enum and pass an animator closure.

```swift
// Custom Animation for DetailButton
configuration.detailButton.animation = .custom(animator: { (view: UIView, settings: AnimatorSettings) in
    // view: The View to perform animation on
    // settings: Preferred duration and delay
})
```

### Secondary Title Color
By setting a [SecondaryColor](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BTitleView.swift) on the TitleView you can change the color of certain characters.

<img align="right" width="360" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/SecondaryColor.jpg" alt="SecondaryColor" />

```swift
// Set secondary color on TitleView Configuration
configuration.titleView.secondaryColor = .init(
    // The start index
    startIndex: 0,
    // The length of characters
    length: 5,
    // The secondary color to apply 
    color: .whatsNewKitLightBlue
)
```
> ☝️ In default the secondaryColor is set to `nil`.

### DetailButton
 <img width="150" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/detailButton.jpg" alt="DetailButton">

By setting an [DetailButton](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BDetailButton.swift) struct on the `WhatsNewViewController.Configuration` struct you can customize the `title` and the corresponding `action` of the displayed detail button on the `WhatsNewViewController`. As the `DetailButton` struct is declared as optional the `WhatsNewViewController` will only display the button if a `DetailButton` configuration is available

| Action | Description   |
| ------------- | ------------- |
| `website` | When the user pressed the detail button a `SFSafariViewController` with the given `URL` will be presented |
| `custom` | After the detail button has been pressed by the user, your custom action will be invoked |

```swift
// Initialize DetailButton with title and open website at url
let detailButton = WhatsNewViewController.DetailButton(
    title: "Read more", 
    action: .website(url: "https://github.com/SvenTiigi/WhatsNewKit")
)

// Initialize DetailButton with title and custom action
let detailButton = WhatsNewViewController.DetailButton(
    title: "Read more", 
    action: .custom(action: { [weak self] whatsNewViewController in
        // Perform custom action on detail button pressed
    })
)
```

### CompletionButton
 <img width="300" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/completionButton.jpg" alt="CompletionButton">

The [CompletionButton](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BCompletionButton.swift) struct configures the displayed title and the action when the user pressed the completion button on the `WhatsNewViewController`.

| Action | Description   |
| ------------- | ------------- |
| `dismiss` | When the user pressed the completion button, the `WhatsNewViewController` will be dismissed. This is the default value |
| `custom` | After the completion button has been pressed by the user, your custom action will be invoked |

```swift
// Initialize CompletionButton with title and dismiss action
let completionButton = WhatsNewViewController.CompletionButton(
    title: "Continue", 
    action: .dismiss
)

// Initialize CompletionButton with title and custom action
let completionButton = WhatsNewViewController.CompletionButton(
    title: "Continue", 
    action: .custom(action: { [weak self] whatsNewViewController in
        // Perform custom action on completion button pressed
    })
)
```

### HapticFeedback 📳

You can enable on both `DetailButton` and `CompletionButton` haptic feedback when the user pressed one of these buttons. Either by setting the property or passing it to the initializer.

```swift
// Impact Feedback
button.hapticFeedback = .impact(.medium)

// Selection Feedback
button.hapticFeedback = .selection

// Notification Feedback with type
let completionButton = WhatsNewViewController.CompletionButton(
    title: "Continue", 
    action: .dismiss,
    hapticFeedback: .notification(.success)
)
```
> ☝️ In default the [HapticFeedback](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BHapticFeedback.swift) is `nil` indicating no haptic feedback should be executed.

### iPad Adjustments

If you wish to modify the `WhatsNewViewController.Configuration` when presenting it on an iPad you can set the `padAdjustment` closure.

```swift
// Set PadAdjustment closure
configuration.padAdjustment = { configuration in
     // Adjust TitleView FontSize
     configuration.titleView.titleFont = .systemFont(ofSize: 45, weight: .bold)
     // Invoke default PadAdjustments (Adjusts Insets for iPad)
     WhatsNewViewController.Configuration.defaultPadAdjustment(&configuration)
}
```
> ☝️ In default the `WhatsNewViewController.Configuration.defaultPadAdjustment` will be invoked.

### WhatsNewVersionStore 💾
<p align="center">
   <img width="750" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewVersionStore.jpg" alt="WhatsNewVersionStore">
</p>

If we speak about presenting awesome new app features we have to take care that this kind of `UI` action only happens once if the user installed the app or opened it after an update. The `WhatsNewKit` offers a protocol oriented solution for this kind of problem via the [WhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/WhatsNewVersionStore.swift) protocol.

```swift
/// WhatsNewVersionStore typealias protocol composition
public typealias WhatsNewVersionStore = WriteableWhatsNewVersionStore & ReadableWhatsNewVersionStore

/// The WriteableWhatsNewVersionStore
public protocol WriteableWhatsNewVersionStore {
    func set(version: WhatsNew.Version)
}

/// The ReadableWhatsNewVersionStore
public protocol ReadableWhatsNewVersionStore {
    func has(version: WhatsNew.Version) -> Bool
}
```

The `WhatsNewViewController` will use the APIs of the `WhatsNewVersionStore` in the following way.

| API      	   | Description   |
| ------------- | ------------- |
| `has(version:)` | Checks if the `Whatsnew.Version` is available and will return `nil` during initialization. |
| `set(version:)` | The `WhatsNew.Version` will be set after the `CompletionButton` has been pressed. |

The `WhatsNewVersionStore` can be passed as an parameter to the initializer. If you do so the initializer will become `optional`.

```swift
// Initialize WhatsNewViewController with WhatsNewVersionStore
let whatsNewViewController: WhatsNewViewController? = WhatsNewViewController(
    whatsNew: whatsNew, 
    versionStore: myVersionStore
)

// Check if WhatsNewViewController is available to present it.
if let controller = whatsNewViewController {
    // Present it as WhatsNewViewController is available 
    // after init with WhatsNewVersionStore
    self.present(controller, animated: true)
} else {
    // WhatsNewViewController is `nil` this Version has already been presented
}

// Or invoke present on the WhatsNewViewController
// to avoid the need of unwrapping the optional
whatsNewViewController?.present(on: self)
```

> ☝️ Please keep in mind the `WhatsNewViewController` initializer will only become `optional` and checks if the Version has been already presented if you pass a `WhatsNewVersionStore` object.

#### Implementation
If you already handled saving user settings in your app to something like `Realm`, `CoreData` or `UserDefaults` you can conform that to the `WhatsNewVersionStore`.

```swift
// Extend your existing App-Logic
extension MyUserSettingsDatabase: WhatsNewVersionStore {
    // Implement me 👨‍💻
}
```

#### Predefined Implementations

`WhatsNewKit` brings along two predefined Implementations of the `WhatsNewVersionStore`.

##### KeyValueWhatsNewVersionStore

The [KeyValueWhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/KeyValueWhatsNewVersionStore.swift) saves and retrieves the `WhatsNew.Version` via a `KeyValueable` protocol conform object. `UserDefaults` and `NSUbiquitousKeyValueStore` are already conform to that protocol 🙌

```swift
// Local KeyValueStore
let keyValueVersionStore = KeyValueWhatsNewVersionStore(
    keyValueable: UserDefaults.standard
)

// iCloud KeyValueStore
let keyValueVersionStore = KeyValueWhatsNewVersionStore(
    keyValueable: NSUbiquitousKeyValueStore.default
)

// Initialize WhatsNewViewController with KeyValueWhatsNewVersionStore
let whatsNewViewController: WhatsNewViewController? = WhatsNewViewController(
    whatsNew: whatsNew, 
    versionStore: keyValueVersionStore
)
```

##### InMemoryWhatsNewVersionStore

The [InMemoryWhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/InMemoryWhatsNewVersionStore.swift) saves and retrieves the `WhatsNew.Version` in memory. Perfect for development or testing phase 👨‍💻

```swift
// Initialize WhatsNewViewController with InMemoryWhatsNewVersionStore
let whatsNewViewController: WhatsNewViewController? = WhatsNewViewController(
    whatsNew: whatsNew, 
    versionStore: InMemoryWhatsNewVersionStore()
)
```

#### WhatsNew.Version
During the initialization of the `WhatsNew` struct the `WhatsNewKit` will automatically retrieve the current App-Version via the [CFBundleShortVersionString](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html) and construct a [WhatsNew.Version](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Models/WhatsNew%2BVersion.swift) for you which is used by the `WhatsNewVersionStore` protocol in order to persist the presented app versions. If you want to manually set the version you can do it like the following example.

```swift
// Initialize Version 1.0.0
let version = WhatsNew.Version(
    major: 1,
    minor: 0,
    patch: 0
)

// Use a String literal
let version: WhatsNew.Version = "1.0.0"

// Current Version in Bundle (Default)
let version = WhatsNew.Version.current()
```

After you initialize a `WhatsNew.Version` you can pass it to the initializer of a `WhatsNew` struct.

```swift
// Initialize WhatsNew with Title and Items
let whatsNew = WhatsNew(
    version: version,
    title: "WhatsNewKit",
    items: []
)
```

If you holding multiple `WhatsNew` structs in an array you can make use of the following two functions to retrieve a `WhatsNew` struct based on the `WhatsNewVersion`.

```swift
let whatsNews: [WhatsNew] = [...]

// Retrieve WhatsNew from array based on Version 1.0.0
let whatsNewVersion1 = whatsNews.get(byVersion:
    .init(major: 1, minor: 0, patch: 0)
)

// Or retrieve it via String as WhatsNew.Version is
// conform to the ExpressibleByStringLiteral protocol
let whatsNewVersion2 = whatsNews.get(byVersion: "2.0.0")

// If you want the WhatsNew for your current App-Version
// based on the CFBundleShortVersionString from Bundle.main
let currentWhatsNew = whatsNews.get()

```

### Codable WhatsNew
The `WhatsNew` struct is conform the `Codable` protocol which allows you to initialize a `WhatsNew` struct via `JSON`.

```JSON
{
    "version": {
        "major": 1,
        "minor": 0,
        "patch": 0
    },
    "title": "WhatsNewKit",
    "items": [
        {
            "title": "Open Source",
            "subtitle": "Contributions are very welcome 👨‍💻",
            "image": "iVBORw0KGgoA..."
        }
    ]
}
```
The optional `image` property of the `WhatsNew.Item` will be decoded and encoded in [Base64](https://en.wikipedia.org/wiki/Base64).

```swift
// Encode to JSON
let encoded = try? JSONEncoder().encode(whatsNew)

// Decode from JSON data
let decoded = try? JSONDecoder().decode(WhatsNew.self, from: data)
```

## Featured on

* [Awesome iOS Weekly](http://weekly.awesomeios.com/issues/2#start)
* [Swift Weekly](http://digest.swiftweekly.com/issues/swift-weekly-issue-118-114740)
* [AppCoda Weekly](http://digest.appcoda.com/issues/appcoda-weekly-issue-74-116292)
* [iOS Goodies](http://ios-goodies.com/post/174437386181/week-232)
* [MyBridge - Open Source Swift Projects (June 2018)](https://medium.mybridge.co/swift-open-source-projects-of-the-month-v-june-2018-f9ce1239eee4)
* [The iOS Times](http://theiostimes.com/issue-44.html)
* [DZone](https://dzone.com/articles/this-week-in-mobile-11-june-2018)
* [Brian Advent](https://youtu.be/zCHEpN1Wgz4)
* [23 Amazing iOS UI Libraries written in Swift for the Past Year (v.2019)](https://medium.mybridge.co/23-amazing-ios-ui-libraries-written-in-swift-for-the-past-year-v-2019-3e5456318768)

## Contributing
Contributions are very welcome 🙌 🤓

## Credits
The `WhatsNew.Item` images ([icons8-github](https://icons8.com/icon/62856/github), [icons8-puzzle](https://icons8.com/icon/61018/puzzle), [icons8-approval](https://icons8.com/icon/59733/approval), [icons8-picture](https://icons8.com/icon/68826/picture)) which are seen on the screenshots and inside the example application are taken from [icons8.com](https://icons8.com/) which are licensed under [Creative Commons Attribution-NoDerivs 3.0 Unported](https://creativecommons.org/licenses/by-nd/3.0/).

## License

```
WhatsNewKit
Copyright (c) 2019 Sven Tiigi <sven.tiigi@gmail.com>

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
