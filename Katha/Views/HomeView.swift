//
//  HomeView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            VStack {
                // header
                Header()
                // Articles
                ScrollView {
                    ForEach(viewModel.articles) { article in
                        // Article Card
                        VStack {
                            CustomArticleCard(article: article, isBookmark: false)

                            Divider()
                                .overlay(Color.theme.gray)
                                .padding(.vertical, 10)
                        }
                    }
                }

            }
          
            .padding(.horizontal)

        // In case of error
            if(viewModel.isError) {
                ContentUnavailableView(label: {
                    Label("An error occurred while fetching articles!", systemImage: "exclamationmark.icloud.fill")
                }, actions: {
                    Button(action: {
                        Task {
                            await viewModel.loadArticles()
                        }
                    }) {
                        Text("Refresh")

                    }
                })
                .padding(.bottom, 200)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadArticles()
            }
        }
        .overlay(content: {
            if viewModel.isLoading {
                ProgressView("Loading articles...")
            }
        })
        .background(Color.theme.background)
    }
    
    
    private struct Header: View {
        var body: some View {
            HStack() {
                Text("Home")
                    .font(.custom(.poppinsMedium, size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
    }

    
}

#Preview {
    HomeView()
}






