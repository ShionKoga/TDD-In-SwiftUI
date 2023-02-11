@testable import TDD_In_Swift
import XCTest
import Combine


class MenuFetcherTest: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testWhenRequestSucceedsPublishesDecodedMenuItems() throws {
        let json = """
        [
            {"name": "a name", "category": "a category", "spicy": true},
            {"name": "another name", "category": "another category", "spicy": true}
        ]
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let networkFetchingStub = NetworkFetchingStub(returning: .success(data))
        let menuFetcher = MenuFetcher(networkFetching: networkFetchingStub)
        
        
        let expectation = XCTestExpectation()
        menuFetcher.fetchMenu()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { items in
                    XCTAssertEqual(items.count, 2)
                    XCTAssertEqual(items.first?.name, "a name")
                    XCTAssertEqual(items.last?.name, "another name")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenRequestFailsPublishesRecievedError() {
        let expectedError = URLError(.badServerResponse)
        let networkFetchingStub = NetworkFetchingStub(returning: .failure(expectedError))
        let menuFetcher = MenuFetcher(networkFetching: networkFetchingStub)
        
        
        let expectation = XCTestExpectation()
        menuFetcher.fetchMenu()
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTAssertEqual(error as? URLError, expectedError)
                    expectation.fulfill()
                },
                receiveValue: { items in
                    XCTFail("Expected to fail, succeeded with \(items)")
                }
            )
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}
