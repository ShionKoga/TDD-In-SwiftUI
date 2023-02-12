import SwiftUI

struct MenuList: View {
    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var orderController: OrderController
        
    var body: some View {
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(section.category) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                destination(for: item)
                            } label: {
                                MenuRow(viewModel: .init(item: item))
                            }
                        }
                    }
                }
            }
        case .failure(let error):
            Text("An error occured:")
            Text(error.localizedDescription).italic()
        }
    }
    
    func destination(for item: MenuItem) -> MenuItemDetail {
        return MenuItemDetail(viewModel: .init(item: item, orderController: orderController))
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: .init(
            menuFetching: MenuFetcher()
        ))
        .environmentObject(OrderController())
    }
}
