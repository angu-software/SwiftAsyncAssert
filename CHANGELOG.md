# Changelog

## HEAD

## 1.1.0

* Ensure compatibility with Swift 6.0
* Account for possible data races when evaluating expressions in case they throwing an error to be 

## 1.0.1

* Fixed `AsyncAssertThrowsError(_:_:_:)` would not execute the error handler closure in case the evaluated expression throws an error.

## 1.0.0

Initial release

_The missing XCTest concurrency assert functions!_

Contains the following assert methods

* `AsyncAssert(_:_:)`
* `AsyncAssertTrue(_:_:)`
* `AsyncAssertFalse(_:_:)`
* `AsyncAssertEqual(_:_:_:)`
* `AsyncAssertEqual(_:_:accuracy:_:)`
* `AsyncAssertNotEqual(_:_:_:)`
* `AsyncAssertNotEqual(_:_:accuracy:_:)`
* `AsyncAssertGreaterThan(_:_:_:)`
* `AsyncAssertGreaterThanOrEqual(_:_:_:)`
* `AsyncAssertLessThan(_:_:_:)`
* `AsyncAssertLessThanOrEqual(_:_:_:)`
* `AsyncAssertIdentical(_:_:_:)`
* `AsyncAssertNotIdentical(_:_:_:)`
* `AsyncAssertNil(_:_:)`
* `AsyncAssertNotNil(_:_:)`
* `AsyncAssertThrowsError(_:_:_:)`
* `AsyncAssertNoThrow(_:_:)`
