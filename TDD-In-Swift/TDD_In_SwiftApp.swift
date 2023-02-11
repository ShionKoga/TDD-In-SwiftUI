import SwiftUI

@main
struct TDD_In_SwiftApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(viewModel: .init(
                    menuFetching: MenuFetcher()
                ))
                    .navigationTitle("Alberto's🇮🇹")
            }
        }
    }
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return Dictionary(grouping: menu, by: { $0.category })
        .map { MenuSection(category: $0, items: $1) }
        .sorted { $0.category > $1.category }
}
