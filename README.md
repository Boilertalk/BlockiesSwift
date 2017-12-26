<a href="https://github.com/Boilertalk/VaporFacebookBot">
  <img src="https://storage.googleapis.com/boilertalk/logo.svg" width="100%" height="256">
</a>

<p align="center">
  <a href="https://travis-ci.org/Boilertalk/BlockiesSwift">
    <img src="http://img.shields.io/travis/Boilertalk/BlockiesSwift.svg?style=flat" alt="CI Status">
  </a>
  <a href="http://cocoapods.org/pods/BlockiesSwift">
    <img src="https://img.shields.io/cocoapods/v/BlockiesSwift.svg?style=flat" alt="Version">
  </a>
  <a href="http://cocoapods.org/pods/BlockiesSwift">
    <img src="https://img.shields.io/cocoapods/l/BlockiesSwift.svg?style=flat" alt="License">
  </a>
  <a href="http://cocoapods.org/pods/BlockiesSwift">
    <img src="https://img.shields.io/cocoapods/p/BlockiesSwift.svg?style=flat" alt="Platform">
  </a>
  <a href="https://github.com/Carthage/Carthage">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible">
  </a>
</p>

# :alembic: BlockiesSwift

<p align="center">
  <img src="sample.png" alt="Sample Blockies">
</p>

This library is a Swift implementation of the [Ethereum fork of Blockies](https://github.com/ethereum/blockies) which is intended to be used with iOS, watchOS, tvOS and macOS.

Blockies generates unique images (identicons) for a given seed string. Those can be used to create images representing an Ethereum (or other Cryptocurrency) Wallet address or really anything else.

## Example

To run the example project, run `pod try BlockiesSwift`. Or clone the repo, and run `pod install` from the Example directory.

## Installation

### CocoaPods

BlockiesSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

```ruby
pod 'BlockiesSwift'
```

### Carthage

BlockiesSwift is compatible with [Carthage](https://github.com/Carthage/Carthage), a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To install it, simply add the following line to your `Cartfile`:

```
github "Boilertalk/BlockiesSwift"
```

## Usage

Basic usage is very straight forward. You just create an instance of `Blockies` with your seed and call `createImage()` to get your image.

```Swift
import BlockiesSwift

let blockies = Blockies(seed: "0x869bb8979d38a8bc07b619f9d6a0756199e2c724")
let img = blockies.createImage()

yourImageView.image = img
```

## Author

Koray Koska, koray@koska.at

## License

BlockiesSwift is available under the MIT license. See the LICENSE file for more info.
