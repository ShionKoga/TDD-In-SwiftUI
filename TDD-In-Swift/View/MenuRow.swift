import SwiftUI

struct MenuRow: View {
    let viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(viewModel: .init(
            item: MenuItem(category: "pasta", name: "spagetti", spicy: true))
        )
    }
}

