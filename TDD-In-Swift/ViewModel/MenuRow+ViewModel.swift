
extension MenuRow {
    struct ViewModel {
        let text: String
        
        init(item: MenuItem) {
            self.text = item.spicy ? "\(item.name)🌶" : item.name
        }
    }
}
