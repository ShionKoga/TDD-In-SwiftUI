@testable import TDD_In_Swift

extension MenuSection {
    static func fixture(
        category: String = "",
        items: [MenuItem] = []
    ) -> MenuSection {
        return MenuSection(
            category: category,
            items: items
        )
    }
}
