//
//  PasswordCohort09Tests.swift
//  PasswordCohort09Tests
//
//  Created by Lenin Baku Cortez Hernandez on 24/06/26.
//

import XCTest

@testable import PasswordCohort09 // import the project

final class PasswordCohort09Tests: XCTestCase {

    //XCTEST its used to Tests logic/business logic

    //Sut = System Under Testing
    //This is the logic we want to test

    private var sut: PasswordViewModel!

    //Setup Function , this function runs at the start of a test
    override func setUp() {
        super.setUp()
        sut = PasswordViewModel()
    }

    //Delete or reset function , it runs at the end of test to reset the app
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    //Test #1
    func testEmptyPassword() {
        //Arrange (create the setup for this test)
        let emptyPassword: String = ""
        //Act perform the logic and user flow for this test
        sut.password = emptyPassword
        sut.checkPassword()
        //Assert (check IF WE have the expected result)
        XCTAssertEqual(sut.strenght, .invalid)
    }

    // Final Challenge
    // Write the rest of the test
    // weak, mid, strong

    //Test #2 - weak
    func testWeakPassword() {
        //Arrange
        let shortPassword: String = "abc"
        //Act
        sut.password = shortPassword
        sut.checkPassword()
        //Assert
        XCTAssertEqual(sut.strenght, .weak)
    }

    //Test #3 - medium
    func testMediumPassword() {
        //Arrange
        let mediumPassword: String = "abcdef"
        //Act
        sut.password = mediumPassword
        sut.checkPassword()
        //Assert
        XCTAssertEqual(sut.strenght, .medium)
    }

    //Test #4 - strong
    func testStrongPassword() {
        //Arrange
        let strongPassword: String = "abcdef123"
        //Act
        sut.password = strongPassword
        sut.checkPassword()
        //Assert
        XCTAssertEqual(sut.strenght, .strong)
    }

}
