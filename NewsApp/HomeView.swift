//
//  ContentView.swift
//  NewsApp
//
//  Created by Devis on 23/11/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var news: [Article] = []
    
    var body: some View {
        VStack {
            ForEach(news, id: \.url){article in
                Text(article.title)
            }
        }
        .onAppear{
            Task{
                await fetchNews()
            }
        }
    }
    func fetchNews() async{
        do{
            let articles = try await NetworkManager.shared.getNews()
            news = articles.articles
        }catch{
            if let error = error as? NetworkError{
                print(error)
            }
        }
    }
}

#Preview {
    HomeView()
}
