//
//  ArticleDetailViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation


class ArticleDetailViewModel: ObservableObject {
    @Published var articlesBySameAuthor: [ArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isBookmarked: Bool = false
    var tags: [String] = []


    @MainActor
    func initialize(_ article: ArticleModel) {
        self.isBookmarked = article.isBookmarked
        self.tags = ArticleTagGenerator.generateTags(count: 5)
    }

    @MainActor
    func loadArticlesByUser(userId: String) async {
        isLoading = true
        do {
            print("userid: \(userId)")
            let articles = try await DatabaseService.shared.fetchArticlesByUser(userId: userId)
            

            self.articlesBySameAuthor = articles
            self.isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
            print("Error fetching articles of user \(userId): \(error)")
        }
    }


    func bookmarkArticle(_ article: ArticleModel) {
        CoreDataManager.shared.saveArticle(article)
        isBookmarked = true
    }

    func unbookmarkArticle(_ article: ArticleModel) {
        CoreDataManager.shared.deleteArticle(withId: article.id)
        isBookmarked = false
    }

}
