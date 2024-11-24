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
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        Task{
            do{
                let articles = try await NetworkManager.shared.getNews()
                topNews = articles.articles
            }catch{
                if let error = error as? NetworkError{
                    print(error)
                }
            }
        }
        
    }
}
