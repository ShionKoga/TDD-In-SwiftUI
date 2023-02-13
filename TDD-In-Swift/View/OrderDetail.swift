import SwiftUI

struct OrderDetail: View {
    let viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail(viewModel: .init())
    }
}
