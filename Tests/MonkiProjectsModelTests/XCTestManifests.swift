import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	return [
		// Apps
		testCase(SocialNetworkTests.allTests),
		// Sports
		testCase(SportTests.allTests),
		testCase(SportLevelTests.allTests),
		// Users
		testCase(MPUserTests.allTests),
		testCase(MPUserCreateTests.allTests),
		testCase(MPUserLoginTests.allTests),
		testCase(MPUserPublicTests.allTests),
		testCase(MPUserTypeTests.allTests),
		// Utilities
		testCase(AvatarSourceTests.allTests),
		testCase(DefaultCaseDecodableTests.allTests),
	]
}
#endif
