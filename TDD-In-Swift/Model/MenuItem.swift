struct MenuItem {
    let category: String
    let name: String
    let spicy: Bool
}

extension MenuItem: Identifiable {
    var id: String { name }
}

extension MenuItem: Equatable {}

extension MenuItem: Decodable {}
