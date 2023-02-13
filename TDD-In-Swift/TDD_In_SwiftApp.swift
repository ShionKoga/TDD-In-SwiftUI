import SwiftUI

@main
struct TDD_In_SwiftApp: App {
    let orderController = OrderController()
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom) {
                NavigationView {
                    MenuList(viewModel: .init(
                        menuFetching: MenuFetcher()
                    ))
                    .navigationTitle("Alberto's🇮🇹")
                }
                OrderButton(viewModel: .init())
            }
            .environmentObject(orderController)
        }
    }
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return Dictionary(grouping: menu, by: { $0.category })
        .map { MenuSection(category: $0, items: $1) }
        .sorted { $0.category > $1.category }
}
