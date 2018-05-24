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

`WhatsNewKit` enables you to showcase your awesome new app features like Apple did with Keynote, Pages, Numbers, etc. WhatsNewKit can be easily configured to your needs while maintaining full configuration possibilities.

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
...

## Advanced
...

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