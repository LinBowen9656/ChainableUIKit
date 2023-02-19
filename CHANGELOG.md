# Change Log

-----

## 4.2.0

* Add new device support.
* Support some new APIs.

-----

## 4.1.0

* Add function to get HEIC format data from UIImage.

-----

## 4.0.0

* Rename function.
* Add the interpolation of the animation.
* Add support for new devices.

-----

## 3.1.1

* Fix the bug of not being able to get the average color of the image.
* Add completionHandler after show UIViewController.
* Add unit test.

-----

## 3.1.0

* Fix a bug that the rgbHexString of UIColor is sometimes wrong.
* Add a new function to calculate the color.
* Change the parameter type of the `invalidateHeightCache` to `Array`.
* Add unit test.

-----

## 3.0.1

* Ignore the UISwitch title when the user interface idiom is mac.

-----

## 3.0.0

* Modify methods.
* Add unit tests.
* Fix bugs.

-----

## 2.2.0

* Add `pushByNavigationController` function.

-----

## 2.1.1

* Fix a bug that `custom` function can't be called.

-----

## 2.1.0

* UIWindow, UIContextualAction and UISwipeActionsConfiguration now support chain-able calls.

---

## 2.0.0

* Rename `Generation` to `Device`.

---

## 1.7.0

* Support iOS 15.
* Fix a bug that the `ChainableWrapper` with struct value can't call function.
* Add `custom` function to call the `ChainableWrapper`'s function in the closure.

---

## 1.6.1

* Add functions to get the CGAffineTransform value.

---

## 1.6.0

* Update to Swift 5.4, replaced @_functionBuilder with @resultBuilder.

---

## 1.5.0

* Add a chain-able function that exchanges the arranged subview at the specified indices.

---

## 1.4.0

* Add a chain-able function that UIView set shadow offset.

---

## 1.3.3

* Fix a bug that set frame of empty view to wrong value.

---

## 1.3.2

* When table view and collection view didn't on the window, call update will force to call reload data.

---

## 1.3.1

* Fix a bug that set frame of empty view to wrong value.

---

## 1.3.0

* Add a chain-able function that UIViewController can be show by other UIViewController.
* Change the `show` and `showDetail` function name.

---

## 1.2.0

* Add a function that can clear UITableView and UICollectionView selection on Apearance.

---

## 1.1.3

* Fix a bug that set `translatesAutoresizingMaskIntoConstraints` to `true` when active layout constraints.

---

## 1.1.2

* Fix SPM warning.

---

## 1.1.1

* Fix a bug that get UIColor HexString wrong.

---

## 1.1.0

* Make UITextField and UITextView, which conforms to the UITextInputTraits protocol, chain-able.
