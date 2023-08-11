# SwiftAsyncAssert

Assert functions to evaluate Swift concurrency async expressions in XCTests.

> The Missing concurrency functions in `XCTest` framework

---

Instead of writing 

```swift
import XCTest

func test_should_succeed() async
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

func test_should_succeed() async 
    await AsyncAssertTrue(try await shouldSucceed())
}

func test_should_throwError() async 
    await AsyncAssertThrowsError(try await shouldFail())
}
```

Less code for your convenience when testing!
