# SwiftAsyncAssert

![platforms](https://img.shields.io/badge/macOS_10.15%7CiOS_13%7CwatchOS_6%7CtvOS_13-orange?logo=swift&label=platforms&labelColor=white&color=%23F05138)<br/>
![version](https://img.shields.io/github/v/release/angu-software/SwiftAsyncAssert?label=Version&labelColor=white&color=%23F05138)
![build status](https://img.shields.io/github/actions/workflow/status/angu-software/SwiftAsyncAssert/swift.yml?logo=githubactions&labelColor=white&label=Build)

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
