// https://github.com/Quick/Quick

@testable import BlockiesSwift
import XCTest

class BlockiesTests: XCTestCase {

    var blockies: Blockies!
    var blockiesRandColor: Blockies!

    override func setUp() {
        blockies = Blockies(seed: "abcd", size: 8, scale: 4, color: UIColor.gray, bgColor: UIColor.green, spotColor: UIColor.blue)
        blockiesRandColor = Blockies(seed: "abcd", size: 4, scale: 10)
    }

    func testSize() throws {
        let bImage = blockies.createImage()
        XCTAssert(bImage?.size.width == 32)
        XCTAssert(bImage?.size.width == 32)

        let doubleImage = blockies.createImage(customScale: 2)
        XCTAssert(doubleImage?.size.width == 64)
        XCTAssert(doubleImage?.size.width == 64)

        let bCImage = blockiesRandColor.createImage()
        XCTAssert(bCImage?.size.width == 40)
        XCTAssert(bCImage?.size.width == 40)

        let bcTripleImage = blockiesRandColor.createImage(customScale: 3)
        XCTAssert(bcTripleImage?.size.width == 120)
        XCTAssert(bcTripleImage?.size.width == 120)
    }

    func testColor() throws {
        XCTAssertEqual(blockies.color, UIColor.gray, "Blockies color wrong")
        XCTAssertEqual(blockies.bgColor, UIColor.green, "Blockies bgColor wrong")
        XCTAssertEqual(blockies.spotColor, UIColor.blue, "Blockies spotColor wrong")
    }
}
