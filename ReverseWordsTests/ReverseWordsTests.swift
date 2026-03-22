//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Nikita on 24.01.2026.
//

import Testing

//struct ReverseWordsTests {
//    @Test func example() async throws {
//        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
//    }
//}

import XCTest

@testable import ReverseWords

final class StringExtensionTests: XCTestCase {
    
    func testWithReversedWords_Sentence() {
        let input = "Hello World"
        let result = input.withReversedWords
        XCTAssertEqual(result, "olleH dlroW")
    }
    
    func testWithReversedWords_SingleWord() {
        let input = "Swift"
        XCTAssertEqual(input.withReversedWords, "tfiwS")
    }

    func testWithReversedWords_EmptyString() {
        let input = ""
        XCTAssertEqual(input.withReversedWords, "")
    }

}
