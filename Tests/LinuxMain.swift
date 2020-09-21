import XCTest

import MonkiProjectsModelTests

var tests = [XCTestCaseEntry]()

// Social Networks
tests += SocialNetworkTests.allTests()
tests += SocialProfileTests.allTests()

// Sports
tests += SportTests.allTests()
tests += SportLevelTests.allTests()

// Users
tests += MPUserTests.allTests()
tests += MPUserCreateTests.allTests()
tests += MPUserLoginTests.allTests()
tests += MPUserPublicTests.allTests()
tests += MPUserTypeTests.allTests()

// Utilities
tests += AvatarSourceTests.allTests()
tests += DefaultCaseDecodableTests.allTests()

XCTMain(tests)
