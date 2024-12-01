//
//  HomeViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var articles: [ArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    var isError: Bool {
        return errorMessage != nil
    }

    @MainActor
    func loadArticles(forceReload: Bool = false) async {
        // Reload only if forceReload is true or articles are empty
        guard forceReload || articles.isEmpty else {
            print("Articles already loaded. Skipping fetch.")
            return
        }

        isLoading = true
        do {
            // Fetch all articles
            let fetchedArticles = try await DatabaseService.shared.fetchAllArticles()
            self.articles = fetchedArticles
            print("Articles successfully loaded!")
        } catch {
            print("Error loading articles: \(error.localizedDescription)")
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }

}
