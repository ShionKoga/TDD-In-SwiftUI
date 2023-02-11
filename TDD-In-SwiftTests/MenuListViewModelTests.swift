@testable import TDD_In_Swift
import Combine
import XCTest


class MenuListViewModelTests: XCTestCase {
    var cancelables = Set<AnyCancellable>()
    
    func testCallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        
        
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingPlaceholder(),
            menuGrouping: spyClosure
        )
        
        
        let sections = viewModel.sections
        XCTAssertTrue(called)
        XCTAssertEqual(sections, inputSections)
    }
    
    func testWhenFetchinStartsPublishesEmptyMenu() {
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingPlaceholder()
        )
        
        
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesSectionsBuitFromRecievedMenuAndGivenGroupingClosure() {
        var recievedMenu: [MenuItem]?
        let expectedSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            recievedMenu = items
            return expectedSections
        }
        
        
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingPlaceholder(),
            menuGrouping: spyClosure
        )
        
        
        let expectation = XCTestExpectation()
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                XCTAssertEqual(recievedMenu, menu)
                XCTAssertEqual(value, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancelables)
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenFetchingFailsPublishesAnError() {
        
    }
}
