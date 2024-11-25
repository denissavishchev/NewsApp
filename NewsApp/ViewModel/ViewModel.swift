//
//  ViewModel.swift
//  NewsApp
//
//  Created by Devis on 24/11/2024.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject{
    
    @Published var topNews: [Article] = []
    @Published var bottomNews: [Article] = []
    
    init() {
        fetchTopNews()
        fetchBottomNews()
    }
    
    func fetchTopNews() {
        Task{
            do{
                let articles = try await NetworkManager.shared.getNews(urlString: URLConstants.topNewsURL)
                topNews = articles.articles
            }catch{
                if let error = error as? NetworkError{
                    print(error)
                }
            }
        }
        
    }
    
    func fetchBottomNews() {
        Task{
            do{
                let articles = try await NetworkManager.shared.getNews(urlString: URLConstants.bottomNewsURL)
                bottomNews = articles.articles
            }catch{
                if let error = error as? NetworkError{
                    print(error)
                }
            }
        }
        
    }
}
