//
//  ArticleDetailView.swift
//  Katha
//
//  Created by Shishir Rijal on 08/10/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let tags = ["iOS", "Swift", "Structure", "Architecture", "Design", "Programming"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack (alignment: .leading) {
                    
                    // Article Title
                    Text("Swift Structs: Unleash Your Inner Code Architect🏗️")
                        .font(.custom(.poppinsBold, size: 30))
                    
                    // Article Author
                    ArticleAuthorHeader()
                    
                    // Thumbnail
                    Image("thumbnail03")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity)
                        .padding(.vertical)
                    
                    
                    
                    
                    // Article Detail
                    Text("If you’re learning Swift, you’ve probably heard the term “struct” a lot. Structs are one of the core building blocks in Swift, and they’re incredibly powerful! This article will guide you through everything you need to know about structs, from the basics to more advanced concepts, and we’ll even throw in some real-world examples along the way.\n**What Exactly Is a Struct?**\nWhen I first heard about structs, I imagined them as LEGO bricks for code. And you know what? That’s not far off! In Swift, a struct (short for structure) is like a blueprint for creating your own custom data types. It’s a way to bundle related properties and methods together into a neat package.\nYou define a struct, and then you can create instances (objects) from it. Structs in Swift are extremely useful for modeling simple data types, like a person’s information, a point in 2D space, or a rectangle’s dimensions.\nIn some other programming languages, you may have seen similar things called classes, but don’t worry — we’ll explore the differences later.")
                    
                    
                    // Tags
                    ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(tags, id: \.self) {tag in
                                            CustomTagChip(tag)
                                    }
                                
                                }
                            }
                    .padding(.vertical)
                    

                    // Author Detail
                    AuthorDetail()
                    
                    
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
                        CustomArticleCard(article: dummyArticles[index], isBookmark: false)
                            
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

#Preview {
    ArticleDetailView()
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
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("author")
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
            Text("Written by Shishir Rijal")
                .font(.custom(.poppinsMedium, size: 20))
            Text("293 Followers")
            Spacer().frame(height: 20)
                .font(.bodyFont(size: 18))
            Text("Mr. Rijal is a computer engineering student passionate about technology specializing in Mobile App Development and Deep Learning.")
        }
        .padding(.vertical)
    }
}

struct ArticleAuthorHeader: View {
    var body: some View {
        HStack {
            Image("author")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 60)
            
            VStack (alignment: .leading) {
                Text("Shishir Rijal")
                    .font(.bodyFont())
                    .fontWeight(.medium)
                Text("6 min read • 3 days ago")
                    .font(.bodyFont())
                
            }
        }
    }
}
