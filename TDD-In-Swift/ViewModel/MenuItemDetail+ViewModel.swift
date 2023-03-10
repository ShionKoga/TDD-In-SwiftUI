import Combine


extension MenuItemDetail {
    class ViewModel: ObservableObject {
        var name: String
        var spicy: String?
        var price: String
        
        @Published private(set) var addOrRemoveFromOrderButtonText: String = ""
        
        private let item: MenuItem
        private let orderController: OrderController
        
        private var cancellables = Set<AnyCancellable>()
        
        init(item: MenuItem, orderController: OrderController) {
            self.item = item
            self.orderController = orderController
            
            self.name = item.name
            self.spicy = item.spicy ? "Spicy" : .none
            self.price = "$\(String(format: "%.2f", item.price))"
            
            orderController.$order
                .sink { [weak self] order in
                    guard let self = self else { return }
                    
                    if (order.items.contains { $0 == self.item }) {
                        self.addOrRemoveFromOrderButtonText = "Remove from order"
                    } else {
                        self.addOrRemoveFromOrderButtonText = "Add to order"
                    }
                }
                .store(in: &cancellables)
        }
        
        
        func addOrRemoveFromOrder() {
            if (orderController.order.items.contains {$0 == item}) {
                orderController.removeFromOrder(item: item)
            } else {
                orderController.addToOrder(item: item)
            }
        }
    }
}
