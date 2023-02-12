import SwiftUI

struct MenuItemDetail: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
//            Text(viewModel.name)
//                .fontWeight(.bold)

//            if let spicy = viewModel.spicy {
//                Text(spicy)
//                    .font(Font.body.italic())
//            }

//            Text(viewModel.price)

            Button(viewModel.addOrRemoveFromOrderButtonText) {
                viewModel.addOrRemoveFromOrder()
            }
            
            Spacer()
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetail(viewModel: .init(
            item: MenuItem(category: "spaghetti", name: "hoge", spicy: false, price: 0),
            orderController: OrderController()
        ))
    }
}
