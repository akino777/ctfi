import XCTest

@testable import ctfi

class ValidateTests: XCTestCase {
    var ctfi = CTFI()
    var number: Bool!
    var japanese: Bool!
    var symbol: Bool!
    var version: Bool!

    override func setUp() {
        super.setUp()
        ctfi.number = false
        ctfi.japanese = false
        ctfi.symbol = false
        ctfi.version = false
    }

    func testValidateWithNoFlags() {
        XCTAssertNil(ctfi.validate())
    }

    func testValidateWithOneFlag() {
        ctfi.number = true
        XCTAssertNil(ctfi.validate())
    }

    func testValidateWithTwoFlags() {
        ctfi.number = true
        ctfi.japanese = true
        XCTAssertEqual(ctfi.validate(), "Only one flag can be specified at a time.")
    }

    func testValidateWithThreeFlags() {
        ctfi.number = true
        ctfi.japanese = true
        ctfi.symbol = true
        XCTAssertEqual(ctfi.validate(), "Only one flag can be specified at a time.")
    }

    func testValidateWithAllFlags() {
        ctfi.number = true
        ctfi.japanese = true
        ctfi.symbol = true
        ctfi.version = true
        XCTAssertEqual(ctfi.validate(), "Only one flag can be specified at a time.")
    }
}
