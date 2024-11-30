//
//  ExploreView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @FocusState private var isSearchBarFocused: Bool

    
    var body: some View {
        NavigationStack {
            VStack {
                Header("Explore")
                ScrollView {
                    VStack (alignment: .center) {


                        SearchBarView(searchText: $viewModel.searchText)
                            .focused($isSearchBarFocused)
                            .onChange(of: viewModel.searchText, perform: { _ in
                                viewModel.searchArticles()
                            })

                        if(!viewModel.searchText.isEmpty) {
                            Header("Search Results")
                                .padding(.bottom, 10)
                            if viewModel.filteredArticles.isEmpty {
                                ContentUnavailableView("No Article Found", image: "", description: Text("No articles matches the given search text"))
                            }
                            ForEach(viewModel.filteredArticles) {article in
                                SearchResultItem( article: article)
                                    .padding(.bottom, 10)
                                Divider()
                            }
                        }

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
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    TrendingItem(index: index + 1, article: article)
                                        .padding(.bottom, 10)

                                }
                                .foregroundColor(.theme.primary)
                            }
                        }


                            
                        Spacer()
                        
                    }

                }

            }
            .onTapGesture {
               // Dismiss keyboard when tapping outside
               isSearchBarFocused = false
            }
            .padding(.horizontal)
            .onAppear {
                Task {
                    await viewModel.loadAllArticles()
                    await viewModel.loadTrendingArticles()
                }
            }
            .alert(isPresented: .constant(viewModel.isError)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error occurred."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    struct Header: View {
        let title: String
        init(_ title: String) {
            self.title = title
        }
        var body: some View {
            HStack() {
                Text(title)
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
                            .multilineTextAlignment(.leading)

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



struct SearchResultItem: View {
    var article: ArticleModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.custom("Poppins-Bold", size: 18))
                .lineLimit(2)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)

            .foregroundColor(.primary)

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
        }
    }
}
