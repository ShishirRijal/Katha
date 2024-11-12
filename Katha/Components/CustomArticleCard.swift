//
//  CustomArticleCard.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct CustomArticleCard: View {
    let article: Article
    let isBookmark: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
          ArticleAuthor(author: article.author.name, image: article.author.image, category: article.category)

            HStack {
                
                VStack(alignment: .leading) {
                    
                    // Introduction
                    ArticleIntroduction(title: article.title, introduction: article.introduction)
                    
                    
                    if(!isBookmark) {
                        Spacer()
                        // ArticleStats
                        ArticleStats(date: article.date.toMonthAndDayFormat(shortMonth: true), claps: article.claps, comments: article.comments, memberOnly: article.memberOnly)
                    }
                }
                
                ArticleThumbnail(thumbnail: article.thumbnail, isBookmark: isBookmark)
                
            }
            
        }
        .frame(width: .infinity, height: isBookmark ? 140 : 200)
       
    }
    
    private struct ArticleAuthor: View {

      let author: String
      let image: String
      let category: String?

        var body: some View {
            HStack {
              Image(image) // Static author image, replace with dynamic if needed
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                HStack {
                    Text(author)
                        .foregroundColor(.theme.primary)
                    
                    if let category = category {
                        Text("in ")
                            .foregroundColor(.theme.gray)
                        + Text(category)
                            .foregroundColor(.theme.primary)
                    }
                }

                .lineLimit(1)
                .opacity(0.9)
            }
            .padding(.bottom, 1)
        }
    }
    
    private struct ArticleThumbnail: View {
        let thumbnail: String
        let isBookmark: Bool
        
        var body: some View {
            VStack {
                Image(thumbnail)
                    .resizable()
                    .frame(height: 80)
                    .aspectRatio(1.3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Spacer()
                if(!isBookmark) {
                    HStack {
                        Image(systemName: "ellipsis.circle")
                        Spacer().frame(width: 30)
                        Image(systemName: "ellipsis")
                    }
                    .foregroundColor(.theme.gray)
                }
                
            }
        }
    }
    
    private struct ArticleStats: View {
        let date: String
        let claps: String
        let comments: String
        let memberOnly: Bool
        
        var body: some View {
            HStack {
                if(memberOnly) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                Text(date)
                
                HStack {
                    Image(systemName: "hands.clap.fill")
                    Text(claps)
                }
                
                HStack {
                    Image(systemName: "message.fill")
                        .scaleEffect(x: -1, y: 1)
                    Text(comments)
                }
            }
            .foregroundColor(.theme.gray)
        }
    }
    
    private struct ArticleIntroduction: View {
        let title: String
        let introduction: String
        
        var body: some View {
            VStack {
                // Article Title
                Text(title)
                    .font(.custom(.poppinsBold, size: 24))
                    .lineLimit(3)
                    .padding(.bottom, 3)
                
                // Article Insight
                Text(introduction)
                    .font(.custom(.poppinsMedium, size: 16))
                    .lineLimit(2)
                    .foregroundColor(.theme.gray)
            }
        }
    }
}


#Preview {
    CustomArticleCard(article: dummyArticles.first!, isBookmark: false)
}
