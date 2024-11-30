//
//  DatabaseService.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//
import Foundation
import Firebase
import FirebaseAuth

class DatabaseService {
    static let shared = DatabaseService()
    private let db = Firestore.firestore()

    // Function to save the article to Firebase
    
    func saveArticle(title: String, content: String) async throws {

        // Fetch the user ID
        guard let userId = Auth.auth().currentUser?.uid else {
            print("Error fetching user ID")
            throw AuthError.requiresRecentLogin
        }

        // Create the document first to get its ID
        let docRef = db.collection("articles").document()
        let articleId = docRef.documentID

        let articleData: [String: Any] = [
            "id": articleId, // Save the document ID as a field
            "title": title,
            "content": content,
            "userId": userId,
            "timestamp": Timestamp()
        ]

        try await docRef.setData(articleData)
    }


    /// Fetch all articles
    func fetchAllArticles() async throws -> [ArticleModel] {
        let snapshot = try await db.collection("articles").getDocuments()
        return try await processArticles(from: snapshot.documents)
    }

    /// Fetch articles by a specific user ID
    func fetchArticlesByUser(userId: String) async throws -> [ArticleModel] {
        let snapshot = try await db.collection("articles")
            .whereField("userId", isEqualTo: userId)
            .getDocuments()
        return try await processArticles(from: snapshot.documents)
    }

    /// Fetch trending Articles
    /// [Considering the latest ones as the trending]
    func fetchTrendingArticles(limit: Int = 10) async throws -> [ArticleModel] {
        let snapshot = try await db.collection("articles")
            .order(by: "timestamp", descending: true)
            .limit(to: limit)
            .getDocuments()
        return try await processArticles(from: snapshot.documents)
    }

    /// Fetch User by a specific user ID
    func fetchUserProfile(id: String) async throws -> UserModel {
        let doc = try await db.collection("users").document(id).getDocument()
        guard let data = doc.data() else {
            throw AuthError.userNotFound
        }
        return try Firestore.Decoder().decode(UserModel.self, from: data)
    }

    // MARK: - Private Helper Methods

    /// Process articles by decoding and enriching them with author details
    private func processArticles(from documents: [QueryDocumentSnapshot]) async throws -> [ArticleModel] {
        var articles = documents.compactMap { doc in
            try? doc.data(as: ArticleModel.self)
        }

        for index in articles.indices {
            let userId = articles[index].userId
            let user = try await fetchUserProfile(id: userId)
            articles[index].author = user
        }

        return articles
    }


}
