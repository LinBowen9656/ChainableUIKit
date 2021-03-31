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

### 1.5.0

- Add a chain-able function that exchanges the arranged subview at the specified indices.

### 1.4.0

- Add a chain-able function that UIView set shadow offset.

### 1.3.3

- Fix a bug that set frame of empty view to wrong value.

### 1.3.2

- When table view and collection view didn't on the window, call update will force to call reload data.

### 1.3.1

- Fix a bug that set frame of empty view to wrong value.

### 1.3.0

- Add a chain-able function that UIViewController can be show by other UIViewController.
- Change the `show` and `showDetail` function name.

### 1.2.0

- Add a function that can clear UITableView and UICollectionView selection on Apearance.

### 1.1.3

- Fix a bug that set `translatesAutoresizingMaskIntoConstraints` to `true` when active layout constraints.

### 1.1.2

- Fix SPM warning.

### 1.1.1

- Fix a bug that get UIColor HexString wrong.

### 1.1.0

- Make UITextField and UITextView, which conforms to the UITextInputTraits protocol, chain-able.
