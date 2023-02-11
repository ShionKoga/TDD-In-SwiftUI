@testable import TDD_In_Swift
import XCTest

class MenuRowViewModelTests: XCTestCase {
    func testWhenItemIsNotSpicyTextIsNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        
        
        XCTAssertEqual(viewModel.text, "name")
    }
    
    func testWhenItemIsSpicyNameWithChiliEmoji() {
        let item = MenuItem.fixture(name: "name", spicy: true)
        let viewModel = MenuRow.ViewModel(item: item)
        
        
        XCTAssertEqual(viewModel.text, "name🌶")
    }
}
