import SwiftUI

struct MenuList: View {
    let sections: [MenuSection]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(section.category) {
                    ForEach(section.items) { item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(sections: groupMenuByCategory(menu))
    }
}
