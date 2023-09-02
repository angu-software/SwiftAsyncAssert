# SwiftAsyncAssert

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fangu-software%2FSwiftAsyncAssert%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/angu-software/SwiftAsyncAssert)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fangu-software%2FSwiftAsyncAssert%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/angu-software/SwiftAsyncAssert)

![version](https://img.shields.io/github/v/release/angu-software/SwiftAsyncAssert?label=Version&color=%23F05138)
![build status](https://img.shields.io/github/actions/workflow/status/angu-software/SwiftAsyncAssert/continous_integration.yml?logo=githubactions&label=Build)

Assert functions to evaluate Swift concurrency async expressions in XCTests.

> The Missing concurrency functions in `XCTest` framework

---

Instead of writing 

```swift
import XCTest

func test_should_succeed() async {
    do {
        let isTrue = try await shouldSucceed()
        XCTAssertTrue(isTrue)
    } catch {
        XCFail("Should not throw an error")
    }
}
```

conveniently write

```swift
import SwiftAsyncAssert

func test_should_succeed() async {
    await AsyncAssertTrue(try await shouldSucceed())
}

func test_should_throwError() async {
    await AsyncAssertThrowsError(try await shouldFail())
}
```

Less code for your convenience when testing!
