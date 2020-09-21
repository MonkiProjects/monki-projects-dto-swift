import XCTest

import MonkiProjectsModelTests

var tests = [XCTestCaseEntry]()

// Users
tests += UserTests.allTests()
tests += UserCreateTests.allTests()
tests += UserLoginTests.allTests()
tests += UserPublicTests.allTests()
tests += UserExperiencesTests.allTests()
tests += UserExperiencesLevelTests.allTests()
tests += UserSocialsTests.allTests()

// Utilities
tests += AvatarSourceTests.allTests()
tests += DefaultCaseDecodableTests.allTests()

XCTMain(tests)
