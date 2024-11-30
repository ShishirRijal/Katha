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
    func loadArticles() async {
        isLoading = true
        do {
            // Fetch all articles
            var fetchedArticles = try await DatabaseService.shared.fetchAllArticles()
            // Fetch user details for each article
            for index in fetchedArticles.indices {
                let userId = fetchedArticles[index].userId
                let user = try await DatabaseService.shared.fetchUserProfile(id: userId)
                fetchedArticles[index].author = user
            }
            self.articles = fetchedArticles
            self.isLoading = false
        } catch {
            print("Error loading articles")
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
}
