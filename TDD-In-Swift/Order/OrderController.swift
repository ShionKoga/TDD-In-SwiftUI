import Combine


class OrderController: ObservableObject {
    @Published private(set) var order: Order

    init(order: Order = Order(items: [])) {
        self.order = order
    }

    func isItemInOrder(_ item: MenuItem) -> Bool {
        return order.items.contains(item)
    }

    func addToOrder(item: MenuItem) {
        order.items.append(item)
    }

    func removeFromOrder(item: MenuItem) {
        order.items.removeAll { $0 == item }
    }
}
