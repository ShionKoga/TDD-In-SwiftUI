@testable import TDD_In_Swift


extension MenuItem {
    static func fixture(
        category: String = "",
        name: String = "",
        spicy: Bool = false,
        price: Double = 0
    ) -> MenuItem {
        return MenuItem(
            category: category,
            name: name,
            spicy: spicy,
            price: price
        )
    }
}
