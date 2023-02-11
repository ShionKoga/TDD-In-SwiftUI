import SwiftUI

struct MenuList: View {
    @ObservedObject var viewModel: ViewModel
        
    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(section.category) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: .init(
            menuFetching: MenuFetchingPlaceholder()
        ))
    }
}
