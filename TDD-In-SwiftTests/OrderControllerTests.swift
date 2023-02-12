@testable import TDD_In_Swift
import XCTest


class OrderControllerTests: XCTestCase {
    func testInitsWithSpecifiedOrder() {
        let order = Order(items: [MenuItem.fixture(name: "a name")])
        
        
        let orderController = OrderController(order: order)
        
        
        XCTAssertEqual(orderController.order.items.count, 1)
        XCTAssertEqual(orderController.order.items.first?.name, "a name")
    }
    
    func testInitsWithEmptyOrder() {
        let orderController = OrderController()
        
        
        XCTAssertTrue(orderController.order.items.isEmpty)
    }
    
    func testWhenItemIsAlreadyInOrderReturnsTrue() {
        let item = MenuItem.fixture(name: "a name")
        let orderController = OrderController(order: Order(items: [item]))
        
        
        let result = orderController.isItemInOrder(item)
        
        
        XCTAssertTrue(result)
    }
    
    func testWhenItemIsNotInOrderReturnsFalse() {
        let orderController = OrderController(order: Order(items: []))
        
        
        let result = orderController.isItemInOrder(MenuItem.fixture())
        
        
        XCTAssertFalse(result)
    }
    
    func testAddingItemUpdatesOrder() {
        let orderController = OrderController()
        
        
        let item = MenuItem.fixture(name: "a name")
        orderController.addToOrder(item: item)
        
        
        XCTAssertEqual(orderController.order.items.count, 1)
        XCTAssertEqual(orderController.order.items.last, item)
    }
    
    func testRemovingItemUpdatesOrder() {
        let orderController = OrderController()
        let item = MenuItem.fixture(name: "a name")
        let otherItem = MenuItem.fixture(name: "another item")
        orderController.addToOrder(item: item)
        orderController.addToOrder(item: otherItem)
        
        
        orderController.removeFromOrder(item: item)
        
        XCTAssertEqual(orderController.order.items.count, 1)
        XCTAssertEqual(orderController.order.items.first, otherItem)
    }
}
