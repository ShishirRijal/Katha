//
//  ExploreViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var trendingArticles: [ArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    var isError: Bool {
        return errorMessage != nil
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
}

