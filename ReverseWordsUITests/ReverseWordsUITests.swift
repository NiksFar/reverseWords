//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Nikita on 26.01.2026.
//
import XCTest

final class ReverseWordsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()

        let userTextField = app.textFields["userTextField"]
        XCTAssertTrue(userTextField.waitForExistence(timeout: 1))
        userTextField.tap()
        userTextField.typeText("Hello World")
        
        app.keyboards.buttons["Return"].tap()

        let reverseButton = app.buttons["reverseButton"]
        XCTAssertTrue(reverseButton.waitForExistence(timeout: 1))
        reverseButton.tap()

        let reverseResultLabel = app.staticTexts["reverseResultLabel"]
        XCTAssertEqual(reverseResultLabel.label, "olleH dlroW")

    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
}

