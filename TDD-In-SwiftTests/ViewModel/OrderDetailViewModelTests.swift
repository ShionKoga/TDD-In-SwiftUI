@testable import TDD_In_Swift
import XCTest


class OrderDetailViewModelTests: XCTestCase {
    func testShowsText() {
        let viewModel = OrderDetail.ViewModel()
        
        
        let text = viewModel.text
        
        
        XCTAssertEqual(text, "OrderDetail")
    }
}
