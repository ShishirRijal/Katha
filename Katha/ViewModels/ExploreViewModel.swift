//
//  ExploreViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var trendingArticles: [ArticleModel] = []
    @Published var allArticles: [ArticleModel] = []
    @Published var filteredArticles: [ArticleModel] = []

    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = "" 

    var isError: Bool {
        return errorMessage != nil
    }



    /// Load all articles
    @MainActor
    func loadAllArticles() async {
        isLoading = true
        do {
            // Fetch all articles
            let articles = try await DatabaseService.shared.fetchAllArticles()
            self.allArticles = articles
            self.filteredArticles = articles
            isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }


    /// Fetch trending articles
    @MainActor
    func loadTrendingArticles(limit: Int = 10) async {
        isLoading = true
        do {
            let articles = try await DatabaseService.shared.fetchTrendingArticles(limit: limit)
            self.trendingArticles = articles
            isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
    

    /// Search articles based on the search text
    @MainActor
    func searchArticles() {
        guard !searchText.isEmpty else {
            filteredArticles = trendingArticles
            return
        }

        filteredArticles = trendingArticles.filter { article in
            article.title.localizedCaseInsensitiveContains(searchText) ||
            article.author?.fullName.localizedCaseInsensitiveContains(searchText) ?? false ||
            article.content.localizedCaseInsensitiveContains(searchText)
        }
    }


}

