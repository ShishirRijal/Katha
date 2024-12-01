//
//  ArticleDetailView.swift
//  Katha
//
//  Created by Shishir Rijal on 08/10/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleModel
    let isBookmarked: Bool // not fetching from article.isBookmarked for differentiating with offline articles

    init(article: ArticleModel, isBookmarked: Bool = false) {
        self.article = article
        self.isBookmarked = isBookmarked
    }



    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ArticleDetailViewModel()


    var body: some View {
        NavigationStack {
            VStack {
                HStack (spacing: 20) {
                    // Back Button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    
                    Spacer()

                    // Share Button
                    Button(action: {
                        if article.isBookmarked {
                            viewModel.unbookmarkArticle(article)
                        } else {
                            viewModel.bookmarkArticle(article)
                        }
                    }, label: {
                        Image(systemName: viewModel.isBookmarked ? "heart.fill": "heart")
                    })
                    .foregroundColor(viewModel.isBookmarked ? .theme.accent : .theme.primary)

                    // Menu Button
                    Button(action: {
                       // Share
                    }, label: {
                        Image(systemName: "ellipsis")
                    })

                }
                .font(.title2)
                .foregroundColor(.theme.primary)
                .padding(.horizontal)
                .padding(.bottom, 10)

                ScrollView {
                    
                    VStack (alignment: .leading) {
                        
                        // Article Title
                        Text(article.title)
                            .font(.custom(.poppinsBold, size: 30))
                        
                        // Article Author
                        ArticleAuthorHeader(article: article)

                        // Article Detail
                        Text(article.content)

                        
                        // Tags [Random For Now]
                        ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(viewModel.tags, id: \.self) {tag in
                                                CustomTagChip(tag)
                                        }
                                    
                                    }
                                }
                        .padding(.vertical)
                        
                    // Hide for Bookmarks
                        if(!isBookmarked) {

                            // Author Detail
                            AuthorDetail(author: article.author!)


                            VStack (alignment: .center) {
                                Text("• • •")
                                    .foregroundColor(Color.theme.primary)
                                    .font(.title2)
                            }
                            .frame(maxWidth: .infinity)


                            VStack (alignment: .center) {
                                // More Articles from current article Author
                                Text("More from \(article.author!.fullName)")
                                    .font(.custom(.poppinsMedium, size: 24))
                                    .foregroundColor(Color.theme.primary)

                                if(viewModel.isLoading) {
                                    ProgressView("Loading...")
                                }
                                else if viewModel.articlesBySameAuthor.isEmpty {
                                    Text("No other articles available.")
                                        .foregroundColor(.gray)
                                   }
                                else {
                                       ForEach(viewModel.articlesBySameAuthor) { authorArticle in
                                           // ignore what's being read
                                           if(authorArticle.id != article.id) {
                                               CustomArticleCard(article: authorArticle, isBookmark: false)

                                                Divider()
                                                   .padding(.vertical, 20)
                                           }
                                       }
                                   }
                            }
                        }

                    }
                    .padding(.horizontal)
                    .onAppear {
                       Task {
                           await viewModel.loadArticlesByUser(userId: article.userId)
                       }
                    }
                }
            }
            .onAppear {
                viewModel.initialize(article)
            }
            .background(Color.theme.background)
        }
        .navigationBarBackButtonHidden(true)

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
    let author: UserModel

    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: author.photoURL), content: { Image in
                    Image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(height:45)
                        .clipShape(Circle())
                }, placeholder: {
                    Image(systemName: "person.fill")
                })

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
            Text("Written by \(author.fullName)")
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
    let article: ArticleModel

    var body: some View {
        HStack {
            if(!article.author!.photoURL.isEmpty) {
                AsyncImage(url: URL(string: article.author!.photoURL), content: { Image in
                    Image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(height:45)
                        .clipShape(Circle())
                }, placeholder: {
                    Image(systemName: "person.fill")
                })
            }

            VStack (alignment: .leading) {
                Text(article.author!.fullName)
                    .font(.bodyFont())
                    .fontWeight(.medium)
                Text("\(article.content.estimatedReadingTime()) min read • \(article.timestamp.dateValue().timeAgoDisplay())")
                    .font(.bodyFont())
                
            }
        }
    }
}


#Preview {
    ArticleDetailView(article: dummyArticle)
        .preferredColorScheme(.dark)
}
