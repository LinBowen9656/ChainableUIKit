# Change Log

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
