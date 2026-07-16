import XCTest

final class LoginRegistrationUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // UI Test 1: Login Flow - simulate user login
    func testLoginFlowWithValidCredentials() {
        app.textFields["loginEmailField"].tap()
        app.textFields["loginEmailField"].typeText("student@test.com")
        
        app.secureTextFields["loginPasswordField"].tap()
        app.secureTextFields["loginPasswordField"].typeText("test123")
        
        app.buttons["loginButton"].tap()
        
        let welcomeText = app.staticTexts["welcomeText"]
        XCTAssertTrue(welcomeText.waitForExistence(timeout: 5))
    }
    
    // UI Test 2: Error Handling - verify error message appears
    func testErrorMessageAppearsOnInvalidLogin() {
        app.textFields["loginEmailField"].tap()
        app.textFields["loginEmailField"].typeText("wrong@test.com")
        
        app.secureTextFields["loginPasswordField"].tap()
        app.secureTextFields["loginPasswordField"].typeText("wrongpass")
        
        app.buttons["loginButton"].tap()
        
        let errorText = app.staticTexts["loginErrorText"]
        XCTAssertTrue(errorText.waitForExistence(timeout: 5))
    }
    
    // UI Test 3: Registration Flow - simulate account creation
    func testRegistrationFlowCreatesAccount() {
        app.buttons["goToRegisterButton"].tap()

        let usernameField = app.textFields["registerUsernameField"]
        XCTAssertTrue(usernameField.waitForExistence(timeout: 5))
        usernameField.tap()
        usernameField.typeText("NewUser")

        app.textFields["registerEmailField"].tap()
        app.textFields["registerEmailField"].typeText("newuser@test.com")

        app.secureTextFields["registerPasswordField"].tap()
        app.secureTextFields["registerPasswordField"].typeText("abc123")

        let confirmField = app.secureTextFields["registerConfirmPasswordField"]
        XCTAssertTrue(confirmField.waitForExistence(timeout: 3))
        confirmField.tap()
        sleep(1)
        confirmField.typeText("abc123")

        app.buttons["registerButton"].tap()

        // If registration succeeded, no error message should appear
        let errorText = app.staticTexts["registerErrorText"]
        XCTAssertFalse(errorText.waitForExistence(timeout: 3))
    }
}
