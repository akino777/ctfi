import XCTest

@testable import ctfi

class BaseTestCase: XCTestCase {
    func testAlphabetGenerate() {
        let count = 15
        let letters = Constants.alphabet
        let characters = Character.generate(count: count, letters: letters)
        XCTAssertEqual(characters.count, count)
    }

    func testNumbersGenerate() {
        let count = 15
        let letters = Constants.numbers
        let characters = Character.generate(count: count, letters: letters)
        XCTAssertEqual(characters.count, count)
    }

    func testJapaneseGenerate() {
        let count = 15
        let letters = Constants.japanese
        let characters = Character.generate(count: count, letters: letters)
        XCTAssertEqual(characters.count, count)
    }

    func testSymbolGenerate() {
        let count = 15
        let letters = Constants.symbol
        let characters = Character.generate(count: count, letters: letters)
        XCTAssertEqual(characters.count, count)
    }
}
