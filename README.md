# ChainableUIKit

Make UIKit chain-able.

## Requirements

- iOS 11.0+
- Xcode 12.4+
- Swift 5.3+

## Usage

```swift
import UIKit
import ChainableUIKit

UIView().chainable
    .borderColor(.black)
    .borderWidth(1)
```

## Release Notes

### 1.1.2

- Fix SPM warning.

### 1.1.1

- Fix a bug that get UIColor HexString wrong.

### 1.1.0

- Make UITextField and UITextView, which conforms to the UITextInputTraits protocol, chain-able.
