//
//  ArticleDetailView.swift
//  Katha
//
//  Created by Shishir Rijal on 08/10/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
        
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack (alignment: .leading) {
                    
                    // Article Title
                    Text(article.title)
                        .font(.custom(.poppinsBold, size: 30))
                    
                    // Article Author
                    ArticleAuthorHeader(article: article)
                    
                    // Thumbnail
                    Image(article.thumbnail)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity)
                        .padding(.vertical)
                    
                    
                    
                    
                    // Article Detail
                    Text(article.introduction)
                    
                    
                    // Tags
                    ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(article.tags, id: \.self) {tag in
                                            CustomTagChip(tag)
                                    }
                                
                                }
                            }
                    .padding(.vertical)
                    

                    // Author Detail
                    AuthorDetail(author: article.author)
                    
                    
                    VStack (alignment: .center) {
                        Text("• • •")
                            .foregroundColor(Color.theme.primary)
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                                            
                    Text("More from Shishir Rijal")
                        .font(.custom(.poppinsMedium, size: 24))
                        .foregroundColor(Color.theme.primary)
                    
                    // Recommended Articles
                    ForEach(0..<2) {index in
                        CustomArticleCard(article: dummyArticle, isBookmark: false)
                            
                        Divider()
                            .padding(.vertical, 20)
                    }
                    
                }
                .padding(.horizontal)
            }
            .background(Color.theme.background)
        }
        
    }
}


struct CustomTagChip: View {
    var label: String?
    var icon: String?
    
    init(_ label: String, icon: String? = nil) {
        self.label = label
        self.icon = icon
    }
    
    var body: some View {
        HStack{
            
            Text(label!)
                .font(.bodyFont(size: 16))
            
            if icon != nil {
                Image(systemName: icon!)
                    .font(.title2)
                
            }
        }
            
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Capsule().fill(.accent))
    }
}

struct AuthorDetail: View {
    let author: Author
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(author.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 90)
                    .clipShape(Circle())
                Spacer()
                HStack {
                    
                    Text("Follow")
                        .font(.bodyFont(size: 20))
                        .foregroundColor(Color.theme.background)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Capsule().fill(Color.theme.reverseBackgroundColor))
                    
                    
                    Image(systemName: "envelope")
                        .font(.title)
                        .foregroundColor(Color.theme.background)
                        .padding(.all, 15)
                        .background(Circle().fill(Color.theme.reverseBackgroundColor))
                    
                }
                
            }
            Text("Written by \(author.name)")
                .font(.custom(.poppinsMedium, size: 20))
            Text("\(author.followers) Followers")
            Spacer().frame(height: 20)
                .font(.bodyFont(size: 18))
            Text(author.bio)
        }
        .padding(.vertical)
    }
}

struct ArticleAuthorHeader: View {
    let article: Article
    var body: some View {
        
        HStack {
            Image(article.author.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 60)
            
            VStack (alignment: .leading) {
                Text(article.author.name)
                    .font(.bodyFont())
                    .fontWeight(.medium)
                Text("\(article.timeToRead()) min read • \(article.date.timeAgoDisplay())")
                    .font(.bodyFont())
                
            }
        }
    }
}


#Preview {
    ArticleDetailView(article: dummyArticles[1])
}
