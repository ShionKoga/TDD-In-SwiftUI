import SwiftUI

struct MenuList: View {
    @ObservedObject var viewModel: ViewModel
        
    var body: some View {
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(section.category) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: .init(item: item))
                        }
                    }
                }
            }
        case .failure(let error):
            Text("An error occured:")
            Text(error.localizedDescription).italic()
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: .init(
            menuFetching: MenuFetcher()
        ))
    }
}
