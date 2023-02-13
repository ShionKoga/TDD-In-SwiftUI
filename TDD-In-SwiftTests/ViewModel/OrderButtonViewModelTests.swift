@testable import TDD_In_Swift
import XCTest


class OrderButtonViewModelTests: XCTestCase {
    func testShowsButtonLabelText() {
        let viewModel = OrderButton.ViewModel()
        
        
        let text = viewModel.text
        
        
        XCTAssertEqual(text, "Your Order")
    }
}
