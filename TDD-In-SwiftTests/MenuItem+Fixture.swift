@testable import TDD_In_Swift


extension MenuItem {
    static func fixture(
        category: String = "",
        name: String = "",
        spicy: Bool = false
    ) -> MenuItem {
        return MenuItem(
            category: category,
            name: name,
            spicy: spicy
        )
    }
}
