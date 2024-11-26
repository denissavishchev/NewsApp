//
//  DetailView.swift
//  NewsApp
//
//  Created by Devis on 26/11/2024.
//

import SwiftUI

struct DetailView: View {
    
    let article: Article
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ImageView(article: article)
            
            VStack(alignment: .leading, spacing: 20){
                Text(article.title)
                    .titleFont()
                if let description = article.description{
                    Text(description)
                        .descriptionFont()
                }
            
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background)
            .background(GradientView())
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct GradientView: View {
    var body: some View {
        GeometryReader { _ in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstants.avatarSize / 4)
            .offset(y: -SizeConstants.avatarSize / 4)
        }
    }
}

struct ImageView: View {
    
    let article: Article

    var body: some View {
        GeometryReader{reader in
            if let url = article.urlToImage, let imageURL = URL(string: url){
                AsyncImage(url: imageURL){ image in
                    if let image = image.image{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -reader.frame(in: .global).minY)
                            .frame(width: SizeConstants.screenWidth, height: reader.frame(in: .global).minY + SizeConstants.avatarSize + 10)
                    }
                }
            }
        }
        .frame(height: SizeConstants.avatarSize)
    }
}
