@testable import TDD_In_Swift
import XCTest


class MenuItemDetailTests: XCTestCase {
    func testWhenItemIsInOrderButtonSaysRemove() {
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        
        let text = viewModel.addOrRemoveFromOrderButtonText


        XCTAssertEqual(text, "Remove from order")
    }

    func testWhenItemIsNotInOrderButtonSaysAdd() {
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        
        let text = viewModel.addOrRemoveFromOrderButtonText
        
        
        XCTAssertEqual(text, "Add to order")
    }

    func testWhenItemIsInOrderButtonActionRemovesIt() {
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        
        viewModel.addOrRemoveFromOrder()
        
        
        XCTAssertFalse(orderController.order.items.contains { $0 == item })
    }

    func testWhenItemIsNotInOrderButtonActionAddsIt() {
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        
        viewModel.addOrRemoveFromOrder()
        
        
        XCTAssertTrue(orderController.order.items.contains { $0 == item })
    }
    
    func testNameIsItemName() {
        let viewModel = MenuItemDetail.ViewModel(
            item: MenuItem.fixture(name: "a name"),
            orderController: OrderController()
        )
        
        
        XCTAssertEqual(viewModel.name, "a name")
    }
    
    func testWhenItemIsSpicyShowsSpicyMessage() {
        let viewModel = MenuItemDetail.ViewModel(
            item: MenuItem.fixture(spicy: true),
            orderController: OrderController()
        )
        
        
        XCTAssertEqual(viewModel.spicy, "Spicy")
    }
    
    func testWhenItemIsNotSpicyDoesNotShowsSpicyMessage() {
        let viewModel = MenuItemDetail.ViewModel(
            item: MenuItem.fixture(spicy: false),
            orderController: OrderController()
        )
        
        
        XCTAssertNil(viewModel.spicy)
    }
    
    func testPriceIsFormattedItemPrice() {
        XCTAssertEqual(
            MenuItemDetail.ViewModel(
                item: .fixture(price: 1.0),
                orderController: OrderController()
            ).price,
            "$1.00"
        )
        XCTAssertEqual(
            MenuItemDetail.ViewModel(
                item: .fixture(price: 2.5),
                orderController: OrderController()
            ).price,
            "$2.50"
        )
        XCTAssertEqual(
            MenuItemDetail.ViewModel(
                item: .fixture(price: 3.45),
                orderController: OrderController()
            ).price,
            "$3.45"
        )
        XCTAssertEqual(
            MenuItemDetail.ViewModel(
                item: .fixture(price: 4.123),
                orderController: OrderController()
            ).price,
            "$4.12"
        )
    }
}
