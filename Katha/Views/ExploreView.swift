//
//  ExploreView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                ScrollView {
                    VStack (alignment: .center) {


                        SearchBarView(searchText: $searchText)
                    
                        PopularSearch()
                            .padding(.vertical, 20)
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color(.systemGray4))
                            .padding(.bottom, 20)
                            
                        
                        HStack {
                            Image(systemName: "chart.line.uptrend.xyaxis.circle")
                                .font(.title)
                            
                            Text("Trending on medium")
                                .textCase(.uppercase)
                                .font(.custom(.poppinsMedium, size: 16))
                            
                            Spacer()
                        }
                        .foregroundColor(.primary)
                        if viewModel.isLoading {
                            ProgressView("Loading trending articles...")
                        } else if viewModel.trendingArticles.isEmpty {
                            Text("No trending articles available.")
                                .foregroundColor(.gray)
                                .font(.bodyFont())
                        } else {
                            ForEach(Array(viewModel.trendingArticles.enumerated()), id: \.element.id) { index, article in
                                TrendingItem(index: index + 1, article: article)
                                    .padding(.bottom, 10)
                            }
                        }


                            
                        Spacer()
                        
                    }

                }

            }
            .padding(.horizontal)
            .onAppear {
                Task {
                    await viewModel.loadTrendingArticles()
                }
            }
        }
    }
    
    struct Header: View {
        var body: some View {
            HStack() {
                Text("Explore")
                    .font(.custom(.poppinsMedium, size: 30))
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
    }
        
        
}


struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            // Search icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            // Search field with placeholder
            TextField("Search Medium...", text: $searchText)
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(5)
    }
}



#Preview {
    ExploreView()
}

struct PopularSearch: View {
    var topSearches = ["UX", "iOS Development", "Gaming", "Apple", "Flutter"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(topSearches, id: \.self) {item in
                    Text(item)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(.systemGray6))
                        .foregroundColor(.primary)
                        .cornerRadius(30)
                }
            }
        }
    }
}


struct TrendingItem: View {
    var index: Int
    var article: ArticleModel

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    
                    Text(String(format: "%02d", index))
                        .font(.custom("Poppins-Bold", size: 40))
                        .foregroundColor(Color(.systemGray))
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: article.author?.photoURL ?? ""), content: { Image in
                                Image
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .padding(.trailing, 5)
                            }, placeholder: {
                                Image(systemName: "person.fill")
                            })

                            
                            Text(article.author?.fullName ?? "Unknown")
                                .font(.custom("Poppins-Medium", size: 18))
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        Text(article.title)
                            .font(.custom("Poppins-Bold", size: 18))
                            .lineLimit(2)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Text("7 min read") // You can make this dynamic if available
                            Text("•")
                            Text("\(article.timestamp.dateValue().timeAgoDisplay())")
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
