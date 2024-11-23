import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    private let urlNews = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=baaecdd4271f4e2a8b97bf2e21aeba62"
    private let decoder = JSONDecoder()

    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getNews() async throws -> News{
        guard let url = URL(string: urlNews) else {throw NetworkError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{throw NetworkError.invalidResponse}
        do{
            return try decoder.decode(News.self, from: data)
        }catch{
            throw NetworkError.invalidData
        }
    }
}
