# Change log

## HEAD

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
