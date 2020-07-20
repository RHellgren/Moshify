# Moshify
> Simple Spotify clone used for a technical interview case.

[![5.0][swift-image]][swift-url]
[![License][license-image]][license-url]
[![iOS](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://developer.apple.com/documentation/)

Fetches new releases from Spotify's public API and displays them in a list with name and cover art. Tapping a cell opens up a detailed view with track list and other information about the album.

## Requirements

- iOS 12.0+
- Xcode 11.4.1

## Setup

In order to run the project you need to manually add a valid Spotify Access token in the file `SpotifyAPIConfig.swift` at (`static let token = "<ADD YOUR TOKEN HERE>"`). See [Spotify Accounts Authentication Examples
](https://github.com/spotify/web-api-auth-examples) for more informaton.

##Dependencies

Thrid party framewoks and Library are managed using Swift Package Manager. The frameworks used are:

- [Kingfisher](https://github.com/onevcat/Kingfisher)



## Meta

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://opensource.org/licenses/MIT
