# spin-arrow

[![CI Status](http://img.shields.io/travis/rafagan/spin-arrow.svg?style=flat)](https://travis-ci.org/rafagan/spin-arrow)
[![Version](https://img.shields.io/cocoapods/v/spin-arrow.svg?style=flat)](http://cocoapods.org/pods/spin-arrow)
[![License](https://img.shields.io/cocoapods/l/spin-arrow.svg?style=flat)](http://cocoapods.org/pods/spin-arrow)
[![Platform](https://img.shields.io/cocoapods/p/spin-arrow.svg?style=flat)](http://cocoapods.org/pods/spin-arrow)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

spin-arrow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'spin-arrow'
```

## Screenshot

Results in:

![Result](https://raw.githubusercontent.com/rafagan/spin-arrow/master/screenshots/example.gif)

## Example

```swift
    let pointer = PointerView()
    pointer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
    pointer.frame = CGRect(x: 100, y: 300, width: 200, height: 10)
    pointer.rotate(angle: angle * Double(i), anchorPoint: CGPoint(x: 0, y: 0.5))
    view.addSubview(pointer)
            
    UIView.animate(withDuration: 3.0, animations: { () -> Void in
        let angle = self.angle * Double(i) + Double.pi
        pointer.rotate(angle: angle)
    })
```

## License

spin-arrow is available under the MIT license. See the LICENSE file for more info.
