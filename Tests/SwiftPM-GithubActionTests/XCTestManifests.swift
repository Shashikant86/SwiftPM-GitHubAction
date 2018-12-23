import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftPM_GithubActionTests.allTests),
    ]
}
#endif