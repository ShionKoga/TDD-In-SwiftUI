@testable import TDD_In_Swift
import XCTest

class MenuItemTests: XCTestCase {
    func testWhenDecodeFromJSONDataHasAllTheInputProperties() throws {
        let json = """
        {"name": "a name", "category": "a category", "spicy": true}
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        
        
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
    }
}
