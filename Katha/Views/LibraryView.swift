//
//  LibraryView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel = LibraryViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Header()
                    .padding(.bottom, 10)
                if viewModel.articles.isEmpty {
                  ContentUnavailableView("No articles found!", systemImage: "bookmark.slash", description: Text("You haven't saved any articles yet.\n"))

                } else {
                  ScrollView {
                      ForEach(viewModel.articles) { article in
                          NavigationLink(destination: ArticleDetailView(article: article, isBookmarked: true)) {
                              VStack {
                                  CustomArticleCard(article: article, isBookmark: true)
                                      .foregroundColor(.theme.primary)
                                  Divider()
                                      .foregroundColor(.theme.lightGray)
                              }

                          }

                      }
                  }
                }
            }
            .onAppear {
                viewModel.fetchArticles()
            }
            .padding(.horizontal)
            .background(Color.theme.background
            .ignoresSafeArea())
        }
    }
    
    private struct Header: View {
        var body: some View {
            HStack() {
                Text("Your Library")
                    .font(.custom(.poppinsMedium, size: 30))
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
    }
    
}


#Preview {
    LibraryView()
}
