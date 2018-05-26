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
   <a href="https://codecov.io/gh/SvenTiigi/WhatsNewKit">
      <img src="https://codecov.io/gh/SvenTiigi/WhatsNewKit/branch/master/graph/badge.svg" alt="Coverage" />
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
WhatsNewKit enables you to easily showcase your awesome new app features. <br/> WhatsNewKit is designed from the ground up to be fully customized to your needs.
</p>
<br/>

<p align="center">
<img src="https://raw.githubusercontent.com/SvenTiigi/WhatsNewKit/gh-pages/readMeAssets/WhatsNewKit.gif" alt="Example Application Screenshot" width="350">
</p>

<br/>

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
`WhatsNewKit` is designed from the ground up to be fully customized to your needs 😎
> 👨‍💻 Please see the Advanced section for further configuration options and details about `WhatsNewKit`.

In order to get a brief look how to use `WhatsNewKit`, the following usage description shows the easiest way of presenting your new app features.

### WhatsNew
To present your awesome new app features, you first have to declare what is new and what are those amazing features inside your app. You start off with a `WhatsNew.Item` which represents a new feature in your app. You initialize a `WhatsNew.Item` by passing a `title`, `subtitle` and an optional `UIImage`.

```swift
// Initialize a WhatsNew.Item which represents an App-Feature
let installationItem = WhatsNew.Item(
    title: "Installation",
    subtitle: "You can install WhatsNewKit via CocoaPods or Carthage",
    image: .init(named: "installation")
)
```

After you initialized various `WhatsNew.Item`s you are good to go to setup the `WhatsNew` struct by passing a `title` and your `WhatsNew.Item` array.

```swift
// Initialize WhatsNew with Title and Items
let whatsNew = WhatsNew(
    title: "WhatsNewKit",
    items: [
        easySetupItem,
        themesItem,
        installationItem,
        openSourceItem
    ]
)
```

### WhatsNewViewController 

The presentation of your new app features are handled via the `WhatsNewViewController`. Simply pass your `WhatsNew` struct to the initializer and present or push the `WhatsNewViewController`

```swift
// Initialize WhatsNewViewController with WhatsNew
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew
)
// Present it
self.present(whatsNewViewController, animated: true)
```

## Advanced
As mentioned before `WhatsNewKit` can be fully customized to your needs. The Advanced section will explain all configuration possibilities and features of `WhatsNewKit` in detail.

### WhatsNewViewController.Configuration
The `WhatsNewViewController.Configuration` struct enables you to customize the `WhatsNewViewController` to your needs. The configuration can be passed to the initializer.

```swift
// Initialize default Configuration
let configuration = WhatsNewViewController.Configuration()

// Initialize WhatsNewViewController with custom configuration
let whatsNewViewController = WhatsNewViewController(
    whatsNew: whatsNew, 
    configuration: configuration
)
```

The `WhatsNewViewController.Configuration` struct consist of three main components `Theme`, `DetailButton` and `CompletionButton` which will be explained in detail in the upcoming subsections.

#### Theme
The `WhatsNewViewController.Configuration.Theme` struct allows you to perfectly match the design to your existing App. You can customize all sort of `UI` related properties. For more details check out the [WhatsNewViewController.Configuration.Theme]() struct.

Beside the full configuration possibilities you can make use of the predefined `Theme` templates which are available as static properties on the `WhatsNewViewController.Configuration.Theme` struct.

`TODO: SOME SCREENSHOTS HERE`

##### Animation
By setting the `animation` property on the `WhatsNewViewController.Configuration.Theme.ItemsViewTheme` you can apply an animation while displaying the `WhatsNew.Item`s.

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

`TODO: A SCREENSHOT HERE`

#### DetailButton
By setting an `DetailButton` struct on the `WhatsNewViewController.Configuration` struct you can customize the `title` and the corresponding `action` of the displayed detail button on the `WhatsNewViewController`. As the `DetailButton` struct is declared as optional the `WhatsNewViewController` will only display the button if a `DetailButton` configuration is available

```swift
// Initialize DetailButton with title and open website at url
let detailButton = WhatsNewViewController.Configuration.DetailButton(
    title: "Read more", 
    action: .website(url: "https://github.com/SvenTiigi/WhatsNewKit")
)

// Initialize DetailButton with title and custom action
let detailButton = WhatsNewViewController.Configuration.DetailButton(
    title: "Read more", 
    action: .custom(action: { (whatsNewViewController) in {
        // Perform custom action on detail button pressed
    })
)
```

#### CompletionButton
The `CompletionButton` struct configures the displayed title and the action when the user pressed the completion button on the `WhatsNewViewController`.

```swift
// Initialize CompletionButton with title and dismiss action
let completionButton = WhatsNewViewController.Configuration.CompletionButton(
    title: "Continue", 
    action: .dismiss
)

// Initialize CompletionButton with title and custom action
let completionButton = WhatsNewViewController.Configuration.CompletionButton(
    title: "Continue", 
    action: .custom(action: { (whatsNewViewController) in {
        // Perform custom action on completion button pressed
    })
)
```

### WhatsNewVersionStore
If we speak about presenting awesome new app features we have to take care that this kind of `UI` action only happens once if the user installed the app or opened it after an update. The `WhatsNewKind` offers a neat solution for this kind of problem via the `WhatsNewVersionStore` protocol.

```swift
public typealias WhatsNewVersionStore = WriteableWhatsNewVersionStore & ReadableWhatsNewVersionStore

public protocol WriteableWhatsNewVersionStore {
    func set(version: WhatsNew.Version)
}

public protocol ReadableWhatsNewVersionStore {
    func has(version: WhatsNew.Version) -> Bool
}
```

If you pass a `WhatsNewVersionStore` object as an initializer Parameter to the `WhatsNewViewController` the initializer will become `optional`.

```swift
// Initialize WhatsNewViewController with WhatsNewVersionStore
let whatsNewViewController: WhatsNewViewController? = WhatsNewViewController(
    whatsNew: whatsNew, 
    versionStore: myVersionStore
)

// Unwrap WhatsNewViewController to check if the WhatsNew.Version
// has already been presented to the user
guard let controller = whatsNewViewController else {
    // User has been informed about this feature
    return
}

// User hasn't seen those new features. Go head and present it
self.present(controller, animated: true)

```

The `WhatsNewViewController` will check if the Version has already been presented and if so it will return `nil` otherwise it will initialize itself and set the `WhatsNewVersionStore` which in results will perform a `set` on the `WhatsNewVersionStore` when the user pressed the `CompletionButton` in order to store that the your new app features have been presented to the user.

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

`UserDefaultsWhatsNewVersionStore`

Saves and retrieves the `WhatsNew.Version` to the `UserDefaults`.

`InMemoryWhatsNewVersionStore`

Saves and retrieves the `WhatsNew.Version` in memory. Perfect for development or testing phase 👌

#### WhatsNew.Version
During the initialization of the `WhatsNew` struct the `WhatsNewKit` will automatically retrieve the current App-Version via the `CFBundleShortVersionString` and construct a `WhatsNew.Version` struct which is used by the `WhatsNewVersionStore` protocol in order to persist the presented app versions. If you want to manually set the version you can do it like the following example.

```swift
// Initialize Version 1.0.0
let version = WhatsNew.Version(
    major: 1,
    minor: 0,
    patch: 0
)

// Or use a String literal
let version = WhatsNew.Version(stringLiteral: "1.0.0")
```


## Contributing
Contributions are very welcome 🙌 🤓

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
