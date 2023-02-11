import SwiftUI

@main
struct TDD_In_SwiftApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(sections: groupMenuByCategory(menu))
                    .navigationTitle("Alberto's🇮🇹")
            }
        }
    }
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return Dictionary(grouping: menu, by: { $0.category })
        .map { MenuSection(category: $0, items: $1) }
}

let menu = [
    MenuItem(category: "starters", name: "Caprese Salad"),
    MenuItem(category: "starters", name: "Arancini Balls"),
    MenuItem(category: "pastas", name: "Penne all'Arrabbiata"),
    MenuItem(category: "pastas", name: "Spaghetti Carbonara"),
    MenuItem(category: "drinks", name: "Water"),
    MenuItem(category: "drinks", name: "Red Wine"),
    MenuItem(category: "desserts", name: "Tiramisù"),
    MenuItem(category: "desserts", name: "Crema Catalana"),
]
