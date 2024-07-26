# spin-arrow

## Requirements

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/Hazer/spin-arrow.git")
]
```

## Screenshot

Results in:

![Result](https://raw.githubusercontent.com/Hazer/spin-arrow/master/screenshots/example.gif)

## Example

```swift
    let pointer = PointerView()
    pointer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
    pointer.frame = CGRect(x: 100, y: 300, width: 200, height: 10)
    pointer.rotate(angle: angle * Double(i))
    view.addSubview(pointer)
            
    UIView.animate(withDuration: 3.0, animations: { () -> Void in
        let angle = self.angle * Double(i) + Double.pi
        pointer.rotate(angle: angle)
    })
```

## License

spin-arrow is available under the MIT license. See the LICENSE file for more info.
