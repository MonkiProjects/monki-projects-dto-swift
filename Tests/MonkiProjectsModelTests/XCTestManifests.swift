import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	return [
		// Users
		testCase(UserTests.allTests),
		testCase(UserCreateTests.allTests),
		testCase(UserLoginTests.allTests),
		testCase(UserPublicTests.allTests),
		testCase(UserExperiencesTests.allTests),
		testCase(UserExperiencesLevelTests.allTests),
		testCase(UserSocialsTests.allTests),
		// Utilities
		testCase(AvatarSourceTests.allTests),
		testCase(DefaultCaseDecodableTests.allTests),
	]
}
#endif
