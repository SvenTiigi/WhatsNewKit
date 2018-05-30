<p align="center">
   <img width="300" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewKitLogo.png" alt="WhatsNewKit Header Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" alt="Swift 4.0">
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
   <a href="https://codebeat.co/projects/github-com-sventiigi-whatsnewkit-master">
      <img src="https://codebeat.co/badges/058f975e-3f81-4466-b8d1-a8dd08830db7" alt="Codebeat">
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
   <img width="600" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewKit.gif" alt="Example">
</p>

## Features

- [x] Customization and Configuration to your needs 💪
- [x] Predefined Themes and Animations 🎬
- [x] Easily check if your Features have already been presented 🎁
- [x] Awesome UI 😍

## Example

The example Application is an excellent way to see `WhatsNewKit` in action. You get a brief look of the available configuration options and how they affect the look and feel of the `WhatsNewViewController`. Simply open the `WhatsNewKit.xcodeproj` and run the `WhatsNewKit-Example` scheme.

## Installation

### CocoaPods

WhatsNewKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'WhatsNewKit', '~> 1.0.0'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate WhatsNewKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "SvenTiigi/WhatsNewKit" ~> 1.0.0
```

Run `carthage update --platform iOS` to build the framework and drag the built `WhatsNewKit.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md)

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate WhatsNewKit into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage
The following first usage description shows the easiest way of presenting your new app features with `WhatsNewKit`.
> 👨‍💻 Please see the [Advanced](https://github.com/SvenTiigi/WhatsNewKit#advanced) section for further configuration options and features.

### WhatsNew
To showcase your awesome new app features, simply setup a [WhatsNew](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Models/WhatsNew.swift) struct with a `title` and `items`. A [WhatsNew.Item](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Models/WhatsNew%2BItem.swift) represents a single feature that you want to showcase.

```swift
// Initialize WhatsNew
let whatsNew = WhatsNew(
    // The Title
    title: "WhatsNewKit",
    // The features you want to showcase
    items: [
        WhatsNew.Item(
            title: "Installation",
            subtitle: "You can install WhatsNewKit via CocoaPods or Carthage",
            image: .init(named: "installation")
        ),
        WhatsNew.Item(
            title: "Open Source",
            subtitle: "Contributions are very welcome 👨‍💻",
            image: .init(named: "openSource")
        )
    ]
)
```

### WhatsNewViewController 

The presentation of your new app features are handled via the [WhatsNewViewController](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/WhatsNewViewController.swift). Simply pass your `WhatsNew` struct to the initializer and present or push the `WhatsNewViewController`

```swift
// Initialize WhatsNewViewController with WhatsNew
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew
)
// Present it
self.present(whatsNewViewController, animated: true)
```

## Advanced
As mentioned before `WhatsNewKit` can be fully customized to your needs. The Advanced section will explain all configuration possibilities and features of `WhatsNewKit` in detail. First off it's important to understand the components of the `WhatsNewViewController` in order to customize the behaviour and `UI`-Design.

<p align="center">
<img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/UILayout.jpg" width="500">
</p>

### WhatsNewViewController.Configuration
The [WhatsNewViewController.Configuration](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Configuration/WhatsNewViewController%2BConfiguration.swift) struct enables you to customize the `WhatsNewViewController` to your needs.

The `WhatsNewViewController.Configuration` consist of three main properties.

| Property      | Description   |
| ------------- | ------------- |
| theme      | All `UI` related settings can be customized here |
| detailButton      | Optional detail button to configure the title and the action that should be performed after pressing |
| completionButton | The completion button to configure the title and the corresponding action that should take place after pressing |

The configuration itself can be passed to the initializer of the `WhatsNewViewController`.

```swift
// Initialize default Configuration
let configuration = WhatsNewViewController.Configuration()

// Initialize WhatsNewViewController with custom configuration
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew, 
    configuration: configuration
)
```

The upcoming subsection will explain the properties `Theme`, `DetailButton` and `CompletionButton` in detail.

#### Theme
The [WhatsNewViewController.Theme](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Theme/WhatsNewViewController%2BTheme.swift) struct allows you to perfectly match the design to your existing App. The following table list the available properties.

| Property      | Description   |
| ------------- | ------------- |
| `backgroundColor`      | The backgroun color of the WhatsNewViewController |
| `titleViewTheme`      | Customize the font and text color of the TitleView |
| `itemsViewTheme` | Adjust title and subtitle via text color and font as well as the auto tint image option |
| `detailButtonTheme` | Title color and font of the DetailButton |
| `completionButtonTheme` | Configure title color and font for the CompletionButton |

##### Templates

Beside the full configuration possibilities you can make use of the predefined [Templates](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Theme/WhatsNewViewController%2BTheme.swift) which are available as static properties on a Theme. All templates are available in white and dark mode 😎.

<p align="center">
<img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/Templates.jpg" width="600">
</p>

```swift
// Dark Red template Theme
let darkRed = WhatsNewViewController.Theme.darkRed

// White Red template Theme
let whiteRed = WhatsNewViewController.Theme.whiteRed
```

For a full overview of the available Templates check out the [Example-Application](https://github.com/SvenTiigi/WhatsNewKit/tree/master/Example).

##### Animation
<img align="right" width="300" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/Animations.gif" alt="Animations" />

By setting the `animation` property on the `WhatsNewViewController.ItemsViewTheme` you can apply an animation while displaying the `ItemsView`.

```swift
// Set custom animation for displaying WhatsNew.Item's
theme.itemsViewTheme.animation = .custom(animator: { (view, count) in
    // view: The View to perform animation on
    // count: The current WhatsNew.Item count (starting at zero)
})
```
Or you can make use of the predefined animations like `fade`, `slideUp`, `slideDown`, `slideLeft`, `slideRight`.

```swift
// Set predefined slideUp theme
theme.itemsViewTheme.animation = .slideUp
```
> ☝️ In default the Animation is set to `.none`

#### DetailButton
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
    action: .custom(action: { (whatsNewViewController) in {
        // Perform custom action on detail button pressed
    })
)
```

#### CompletionButton
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
    action: .custom(action: { (whatsNewViewController) in {
        // Perform custom action on completion button pressed
    })
)
```

#### HapticFeedback
You can enable on both `DetailButton` and `CompletionButton` haptic feedback when the user pressed one of these buttons. Either by setting the property or passing it to the initializer.

```swift
// Impact Feedback
button.hapticFeedback = .impact

// Selection Feedback
button.hapticFeedback = .selection

// Notification Feedback with type
let completionButton = WhatsNewViewController.CompletionButton(
    title: "Continue", 
    action: .dismiss,
    hapticFeedback: .notification(.success)
)
```
> ☝️ In default the `HapticFeedback` is `nil` indicating no haptic feedback should be executed.

### WhatsNewVersionStore
<p align="center">
   <img width="750" src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewVersionStore.jpg" alt="WhatsNewVersionStore">
</p>

If we speak about presenting awesome new app features we have to take care that this kind of `UI` action only happens once if the user installed the app or opened it after an update. The `WhatsNewKind` offers a neat solution for this kind of problem via the [WhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/WhatsNewVersionStore.swift) protocol.

```swift
public typealias WhatsNewVersionStore = WriteableWhatsNewVersionStore & ReadableWhatsNewVersionStore

public protocol WriteableWhatsNewVersionStore {
    func set(version: WhatsNew.Version)
}

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
// If it's nil the user has already seen your new features for the corresponding Version.
// ...
```

> ☝️ Please keep in mind the `WhatsNewViewController` initializer will only become `optional` and checks if the Version has been already presented if you pass a `WhatsNewVersionStore` object.

#### Implementation
If you already handled saving user settings in your app to something like `Realm`, `CoreData` or `UserDefaults` you can conform the `WhatsNewVersionStore` and pass it as an initializer parameter to the `WhatsNewViewController`.

```swift
// Extend your existing App-Logic
extension MyUserSettingsDatabase: WhatsNewVersionStore {
    // Implement me 👨‍💻
}
```

##### Predefined Implementations

If not you can make use of the predefined `WhatsNewVersionStore` implementations which `WhatsNewKit` offers.

[KeyValueWhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/KeyValueWhatsNewVersionStore.swift)

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

> Saves and retrieves the `WhatsNew.Version` via a `KeyValueable` protocol conform object. UserDefaults and NSUbiquitousKeyValueStore are already conform to that protocol 🙌

[InMemoryWhatsNewVersionStore](https://github.com/SvenTiigi/WhatsNewKit/blob/master/Sources/Store/InMemoryWhatsNewVersionStore.swift)

```swift
// Initialize WhatsNewViewController with InMemoryWhatsNewVersionStore
let whatsNewViewController: WhatsNewViewController? = WhatsNewViewController(
    whatsNew: whatsNew, 
    versionStore: InMemoryWhatsNewVersionStore()
)
```

> Saves and retrieves the `WhatsNew.Version` in memory. Perfect for development or testing phase 👨‍💻

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
let version = WhatsNew.Version(stringLiteral: "1.0.0")

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
            "image": "data:image/png;base64,R0lG42......."
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

## Contributing
Contributions are very welcome 🙌 🤓

## Credits
The `WhatsNew.Item` images ([icons8-github](https://icons8.com/icon/62856/github), [icons8-puzzle](https://icons8.com/icon/61018/puzzle), [icons8-approval](https://icons8.com/icon/59733/approval), [icons8-picture](https://icons8.com/icon/68826/picture)) which are seen on the screenshots and inside the example application are taken from [icons8.com](https://icons8.com/) which are licensed under [Creative Commons Attribution-NoDerivs 3.0 Unported](https://creativecommons.org/licenses/by-nd/3.0/).

## License

```
WhatsNewKit
Copyright (c) 2018 Sven Tiigi <sven.tiigi@gmail.com>

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
