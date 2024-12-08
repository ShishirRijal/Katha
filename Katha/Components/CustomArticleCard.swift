//
//  CustomArticleCard.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct CustomArticleCard: View {
    let article: ArticleModel
    let isBookmark: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ArticleAuthor(author: article.author?.fullName ?? "Unknown", image: article.author?.photoURL ?? "")

            VStack(alignment: .leading) {
                // Introduction
                ArticleIntroduction(title: article.title, introduction: article.content)
                    .padding(.bottom, 5)

                if(!isBookmark) {
//
                    // ArticleStats
                    ArticleStats(date: article.timestamp.dateValue().toMonthAndDayFormat(shortMonth: true))
                        .padding(.vertical, 10)
                }
            }

        }
//        .frame(width: .infinity, height: isBookmark ? 140 : 200)
       
    }
    
    private struct ArticleAuthor: View {

      let author: String
      let image: String

        var body: some View {
            HStack {
                if(!image.isEmpty) {
                    AsyncImage(url: URL(string: image), content: { Image in
                        Image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(height:30)
                            .clipShape(Circle())
                    }, placeholder: {
                        Image(systemName: "person.fill")
                    })
                }

                Text(author)
                    .foregroundColor(.theme.primary)
                .lineLimit(1)
                .opacity(0.9)
            }
            .padding(.bottom, 1)
        }
    }
    
//    private struct ArticleThumbnail: View {
//        let thumbnail: String
//        let isBookmark: Bool
//        
//        var body: some View {
//            VStack {
//                Image(thumbnail)
//                    .resizable()
//                    .frame(height: 80)
//                    .aspectRatio(1.3, contentMode: .fit)
//                    .clipShape(RoundedRectangle(cornerRadius: 5))
//                
//                Spacer()
//                if(!isBookmark) {
//                    HStack {
//                        Image(systemName: "ellipsis.circle")
//                        Spacer().frame(width: 30)
//                        Image(systemName: "ellipsis")
//                    }
//                    .foregroundColor(.theme.gray)
//                }
//                
//            }
//        }
//    }
    
    private struct ArticleStats: View {
        let date: String
        let claps: String
        let comments: String
        let memberOnly: Bool

        // Initializer with random values
        init(date: String) {
            self.date = date
            self.claps = "\(Int.random(in: 10...1000))"
            self.comments = "\(Int.random(in: 0...200))"
            self.memberOnly = Bool.random()
        }


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
            VStack(alignment: .leading) {
                // Article Title
                Text(title.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(.custom(.poppinsBold, size: 24))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.8)
                    .padding(.bottom, 5)

                // Article Insight
                Text(introduction.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(.custom(.poppinsMedium, size: 16))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.theme.gray)
                    .minimumScaleFactor(0.8)
            }
        }
    }

}


#Preview {
    CustomArticleCard(article: dummyArticle, isBookmark: false)
}
