@testable import TDD_In_Swift
import Combine
import XCTest


class MenuListViewModelTests: XCTestCase {
    var cancelables = Set<AnyCancellable>()
    
    func testWhenFetchinStartsPublishesEmptyMenu() throws {
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingPlaceholder()
        )
        
        
        let sections = try viewModel.sections.get()
        XCTAssertTrue(sections.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesSectionsBuitFromRecievedMenuAndGivenGroupingClosure() {
        var recievedMenu: [MenuItem]?
        let expectedSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            recievedMenu = items
            return expectedSections
        }
        
        
        let expectedMenu = [MenuItem.fixture()]
        let menuFetchingStub = MenuFetchingStub(returning: .success(expectedMenu))
        let viewModel = MenuList.ViewModel(
            menuFetching: menuFetchingStub,
            menuGrouping: spyClosure
        )
        
        
        let expectation = XCTestExpectation()
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .success(let sections) = value else {
                    return XCTFail("Expected a successful Result, got: \(value)")
                }
                XCTAssertEqual(recievedMenu, expectedMenu)
                XCTAssertEqual(sections, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancelables)
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenFetchingFailsPublishesAnError() {
        let expectedError = TestError(id: 123)
        let menuFetchingStub = MenuFetchingStub(returning: .failure(expectedError))
        
        
        let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub)
        
        
        let expectation = XCTestExpectation()
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .failure(let error) = value else {
                    return XCTFail("Expected a failing result, got \(value)")
                }
                XCTAssertEqual(error as? TestError, expectedError)
                expectation.fulfill()
            }
            .store(in: &cancelables)
        wait(for: [expectation], timeout: 1)
    }
}
