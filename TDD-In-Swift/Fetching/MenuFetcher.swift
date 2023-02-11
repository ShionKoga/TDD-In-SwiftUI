import Combine
import Foundation


class MenuFetcher: MenuFetching {
    let networkFetching: NetworkFetching
    
    init(networkFetching: NetworkFetching = URLSession.shared) {
        self.networkFetching = networkFetching
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        let urlString = "https://raw.githubusercontent.com/mokagio/tddinswift_fake_api/trunk/menu_response.json"
        let url = URL(string: urlString)!

        return networkFetching.load(URLRequest(url: url))
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
