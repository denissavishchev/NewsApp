//
//  BottomArticleView.swift
//  NewsApp
//
//  Created by Devis on 25/11/2024.
//

import SwiftUI

struct BottomArticleView: View {
    
    let article: Article
    
    var body: some View {
        VStack{
            if let url = article.urlToImage, let imageURL = URL(string: url){
                AsyncImage(url: imageURL){image in
                    if let image = image.image{
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    }else{
                        ZStack{
                            Rectangle()
                                .frame(width: 120, height: 120)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .cornerRadius(10)
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 50)
                        }
                    }
                }
            }
            VStack(alignment: .leading){
                Text(article.title)
                    .titleFont()
                Spacer()
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
        }
        .frame(width: 120, height: 240)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}
