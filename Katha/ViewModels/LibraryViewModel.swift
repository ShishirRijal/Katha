//
//  LibraryViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var articles: [ArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let databaseService = DatabaseService.shared

    func fetchArticles() {
        self.articles = CoreDataManager.shared.fetchAllBookmarkedArticles()
        print("fetched bookmarked articles: \(articles.count)")

    }



}
