import XCTest
@testable import LoginRegistrationApp

final class AuthViewModelTests: XCTestCase {

    var sut: AuthViewModel!

    override func setUp() {
        super.setUp()
        sut = AuthViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // Test 1: Email Validation - invalid format
    func testInvalidEmailFormatFailsValidation() {
        XCTAssertFalse(sut.isValidEmail("not-an-email"))
    }

    // Test 2: Password Validation - weak password
    func testWeakPasswordFailsValidation() {
        XCTAssertFalse(sut.isValidPassword("abc"))
    }

    // Test 3: Empty Fields - empty login attempt
    func testEmptyLoginFieldsShowsError() {
        sut.loginEmail = ""
        sut.loginPassword = ""
        sut.login()
        XCTAssertEqual(sut.loginErrorMessage, "Email and password cannot be empty")
    }

    // Test 4: Password Match - confirm password mismatch
    func testPasswordMismatchShowsError() {
        sut.regUsername = "NewUser"
        sut.regEmail = "newuser@test.com"
        sut.regPassword = "abc123"
        sut.regConfirmPassword = "xyz123"
        sut.register()
        XCTAssertEqual(sut.registerErrorMessage, "Passwords do not match")
    }

    // Test 5: Login Logic - successful login
    func testSuccessfulLoginWithHardcodedAccount() {
        sut.loginEmail = "student@test.com"
        sut.loginPassword = "test123"
        sut.login()
        XCTAssertTrue(sut.isLoggedIn)
        XCTAssertEqual(sut.loggedInUsername, "Student")
    }
}
