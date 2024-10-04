//
//  CustomArticleCard.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct CustomArticleCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            ArticleAuthor()
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    // Introduction
                    ArticleIntroduction()
                    Spacer()
                    // ArticleStats
                    ArticleStats()
                }
                
                ArticleThumbnail()
                
            }
            
        }
        .frame(width: .infinity, height: 200)
    }
    
    
    
        
    private struct ArticleAuthor: View {
        var body: some View {
            HStack {
                Image("author")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                VStack {
                    Text("Sandhya Sharma")
                        .foregroundColor(.theme.primary)
                    + Text(" in ")
                        .foregroundColor(.theme.gray)
                    + Text("Data Science")
                        .foregroundColor(.theme.primary)
                }
                .opacity(0.9)
                
                
            }
            .padding(.bottom, 1)
        }
    }
        
        
    private struct ArticleThumbnail: View {
        var body: some View {
            VStack {
                Image("thumbnail01")
                    .resizable()
                    .frame(height: 80)
                    .aspectRatio(1.3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Spacer()
                HStack {
                    Image(systemName: "ellipsis.circle")
                    Spacer().frame(width: 30)
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.theme.gray)
                
            }
        }
    }
        
    private struct ArticleStats: View {
        var body: some View {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("Jan 15")
                
                Image(systemName: "hands.clap.fill")
                Text("2.7K")
                
                Image(systemName: "message.fill")
                    .scaleEffect(x: -1, y: 1)
                Text("2.7K")
            }
            .foregroundColor(.theme.gray)
        }
    }
    
    private struct ArticleIntroduction: View {
        var body: some View {
            VStack {
                // Article Title
                Text("Mobile Developers Have Lost Htier Glory, And Here's Why")
                    .font(.custom(.poppinsBold, size: 24))
                    .lineLimit(3)
                    .padding(.bottom, 3)
                
                // Article Insight
                Text("I recently saw this research published in indeed.com where the survery among developers showcased the ")
                    .font(.custom(.poppinsMedium, size: 16))
                    .lineLimit(2)
                    .foregroundColor(.theme.gray)
            }
        }
    }
    
    
}


#Preview {
    CustomArticleCard()
}
